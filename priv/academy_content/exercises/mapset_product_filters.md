%{
  title: "MapSet Product Filters"
}
---
# MapSet Product Filters

```elixir
Mix.install([
  {:jason, "~> 1.4"},
  {:kino, "~> 0.9", override: true},
  {:youtube, github: "brooklinjazz/youtube"},
  {:hidden_cell, github: "brooklinjazz/hidden_cell"},
  {:benchee, "~> 1.1"},
  {:faker, "~> 0.17.0"}
])
```

## Navigation

<div style="display: flex; align-items: center; width: 100%; justify-content: space-between; font-size: 1rem; color: #61758a; background-color: #f0f5f9; height: 4rem; padding: 0 1rem; border-radius: 1rem;">
<div style="display: flex;">
<i class="ri-home-fill"></i>
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="../start.livemd">Home</a>
</div>
<div style="display: flex;">
<i class="ri-bug-fill"></i>
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="https://github.com/DockYard-Academy/curriculum/issues/new?assignees=&labels=&template=issue.md&title=MapSet Product Filters">Report An Issue</a>
</div>
<div style="display: flex;">
<i class="ri-arrow-left-fill"></i>
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="../exercises/mapset_drills.livemd">MapSet Drills</a>
</div>
<div style="display: flex;">
<a style="display: flex; color: #61758a; margin-right: 1rem;" href="../exercises/fibonacci_challenge.livemd">Fibonacci Sequence</a>
<i class="ri-arrow-right-fill"></i>
</div>
</div>

## MapSet Product Filters

Previously in the [Product Filters](./product_filters.livemd) exercise, you built an application where users search for products based on certain filters.

Each product is a map with a `:name`, `:category`, and `:price` (in cents).

Instead of using a list of products, you're going to re-implement the product search using a [MapSet](https://hexdocs.pm/elixir/MapSet.html) of products.

```elixir
products =
  MapSet.new([
    %{name: "Laptop", category: :tech, price: 100_000},
    %{name: "Phone", category: :tech, price: 50000},
    %{name: "Chocolate", category: :snacks, price: 200},
    %{name: "Shampoo", category: :health, price: 1000}
  ])
```

You're going to refactor and re-implement your existing `Products.filter/2` function and test cases using MapSets.

You should be able to filter by:

1. a partial case-insensitive `:name` field.
2. an inclusive `:min` and `:max` price.
3. an exact `:category` field as an atom.

<!-- livebook:{"break_markdown":true} -->

<details style="background-color: lightgreen; padding: 1rem; margin: 1rem 0;">
<summary>Example Test Cases</summary>

```elixir
ExUnit.start(auto_run: false)

defmodule MapSetProductsTest do
  use ExUnit.Case

  test "filter/2 empty filters" do
    products = MapSet.new([make_product()])
    assert MapSetProducts.filter(products, []) == products
  end

  test "filter/2 by exact matching name" do
    found = make_product(name: "AAA")
    not_found = make_product(name: "B")
    products = MapSet.new([found, not_found])
    assert MapSetProducts.filter(products, name: "AAA") == MapSet.new([found])
  end

  test "filter/2 by partial matching name" do
    found = make_product(name: "AAA")
    not_found = make_product(name: "B")
    products = MapSet.new([found, not_found])
    assert MapSetProducts.filter(products, name: "A") == MapSet.new([found])
  end

  test "filter/2 by mixed case partial matching name" do
    found = make_product(name: "AAA")
    not_found = make_product(name: "B")
    products = MapSet.new([found, not_found])
    assert MapSetProducts.filter(products, name: "a") == MapSet.new([found])
  end

  test "filter/2 by category" do
    found = make_product(category: :tech)
    not_found = make_product(category: :health)
    products = MapSet.new([found, not_found])
    assert MapSetProducts.filter(products, category: :tech) == MapSet.new([found])
  end

  test "filter/2 by min price" do
    found_above = make_product(price: 110)
    found_exact = make_product(price: 100)
    not_found = make_product(price: 90)
    products = MapSet.new([found_above, found_exact, not_found])
    assert MapSetProducts.filter(products, min: 100) == MapSet.new([found_above, found_exact])
  end

  test "filter/2 by max price" do
    not_found = make_product(price: 110)
    found_exact = make_product(price: 100)
    found_below = make_product(price: 90)
    products = MapSet.new([found_below, found_exact, not_found])
    assert MapSetProducts.filter(products, max: 100) == MapSet.new([found_below, found_exact])
  end

  test "filter/2 by max and min price" do
    not_found_above = make_product(price: 110)
    found = make_product(price: 100)
    not_found_below = make_product(price: 90)
    products = MapSet.new([not_found_above, found, not_found_below])
    assert MapSetProducts.filter(products, max: 100, min: 100) == MapSet.new([found])
  end

  test "filter/2 all filters" do
    not_found_above = make_product(name: "AAA", category: :tech, price: 110)
    not_found_below = make_product(name: "AAA", category: :tech, price: 90)
    not_found_name = make_product(name: "BBB", category: :tech, price: 100)
    not_found_category = make_product(name: "AAA", category: :health, price: 100)
    found = make_product(name: "AAA", category: :tech, price: 100)

    products =
      MapSet.new([found, not_found_above, not_found_below, not_found_name, not_found_category])

    assert MapSetProducts.filter(products, name: "a", category: :tech, max: 100, min: 100) ==
             MapSet.new([found])
  end

  defp make_product(attrs \\ %{}) do
    Enum.into(attrs, %{
      name: Enum.random(["A", "B", "C"]),
      category: Enum.random([:tech, :toys, :candy]),
      price: Enum.random(1..100)
    })
  end
end

ExUnit.run()
```

</details>

<!-- livebook:{"break_markdown":true} -->

<details style="background-color: lightgreen; padding: 1rem; margin: 1rem 0;">
<summary>Example Solution</summary>

In this example, we solve the problem by enumerating over products and checking each filter.

```elixir
defmodule MapSetProducts do
  def filter(products, filters \\ []) do
    name_filter = filters[:name]
    category_filter = filters[:category]
    min_filter = filters[:min]
    max_filter = filters[:max]

    MapSet.filter(products, fn product ->
      matches_name = !name_filter || Regex.match?(~r/#{name_filter}/i, product.name)
      matches_category = !category_filter || product.category == category_filter
      matches_min = !min_filter || min_filter <= product.price
      matches_max = !max_filter || product.price <= max_filter

      matches_name and matches_category and matches_min and matches_max
    end)
  end
end
```

</details>

<!-- livebook:{"break_markdown":true} -->

Implement the `MapSetProducts` module using [MapSet](https://hexdocs.pm/elixir/MapSet.html) instead of the [Enum](https://hexdocs.pm/elixir/Enum.html) module.

```elixir
defmodule MapSetProducts do
  @moduledoc """
  Documentation for `Products`
  """

  @doc """
  Filter products by name, category, and price.
  The name filter should be partial and case insensitive.

  ## Examples

    No filters returns all products.

      iex> MapSetProducts.filter(MapSet.new([%{name: "Laptop", category: :tech, price: 100}]), [])
      MapSet.new([%{name: "Laptop", category: :tech, price: 100}])

    Filter by name (case insensitive and partial matching)

      iex> MapSetProducts.filter(MapSet.new([%{name: "Laptop", category: :tech, price: 100}]), name: "l")
      MapSet.new([%{name: "Laptop", category: :tech, price: 100}])

    Multiple Filters

      iex> MapSetProducts.filter(MapSet.new([%{name: "Laptop", category: :tech, price: 100}]), min: 50, max: 200, name: "Laptop", category: :tech)
      MapSet.new([%{name: "Laptop", category: :tech, price: 100}])
  """
  def filter(products, filters \\ []) do
  end
end

ExUnit.start(auto_run: false)

defmodule MapSetProductsTest do
  use ExUnit.Case

  test "filter/2 empty filters"

  test "filter/2 by exact matching name"

  test "filter/2 by partial matching name"

  test "filter/2 by mixed case partial matching name"

  test "filter/2 by category"

  test "filter/2 by min price"

  test "filter/2 by max price"

  test "filter/2 by max and min price"

  test "filter/2 all filters"
end

ExUnit.run()
```

## Bonus: Benchmark

Did using [MapSet](https://hexdocs.pm/elixir/MapSet.html) improve the performance of your solution? Use [Benchee](https://hexdocs.pm/benchee/Benchee.html) to find out. Ensure you benchmark your solution with a large and varied data set. We've included the [Faker](https://hexdocs.pm/faker/readme.html) project to make this easier.

```elixir
Faker.Food.dish()
```

Consider adding the `:memory_time` option to your benchmark to see which solution is more memory efficient.

<!-- livebook:{"break_markdown":true} -->

<details style="background-color: lightgreen; padding: 1rem; margin: 1rem 0;">
<summary>Example Solution</summary>

```elixir
names = Enum.map(1..1000, fn _ -> Faker.Food.dish() end)
categories = [:a, :b, :c, :d, :e, :f, :g, :h, :i, :j, :k, :l, :m, :n, :o, :p]

products =
  for name <- names,
      category <- categories,
      do: %{name: name, category: category, price: Enum.random(1..100)}

filters = [name: "1", category: :tech, min: 25, max: 50]

mapset_products = MapSet.new(products)

Benchee.run(
  %{
    "Enum" => fn -> EnumProducts.filter(products, filters) end,
    "Stream" => fn -> StreamProducts.filter(mapset_products, filters) end
    "MapSet" => fn -> MapSetProducts.filter(mapset_products, filters) end
  },
  memory_time: 2
)
```

</details>

<!-- livebook:{"break_markdown":true} -->

You may create your solution below, or consider creating a `product_filters` mix project with all of your solutions and benchmarks as a GitHub project for your future resume!

```elixir

```

## Commit Your Progress

DockYard Academy now recommends you use the latest [Release](https://github.com/DockYard-Academy/curriculum/releases) rather than forking or cloning our repository.

Run `git status` to ensure there are no undesirable changes.
Then run the following in your command line from the `curriculum` folder to commit your progress.

```
$ git add .
$ git commit -m "finish MapSet Product Filters exercise"
$ git push
```

We're proud to offer our open-source curriculum free of charge for anyone to learn from at their own pace.

We also offer a paid course where you can learn from an instructor alongside a cohort of your peers.
We will accept applications for the June-August 2023 cohort soon.

## Navigation

<div style="display: flex; align-items: center; width: 100%; justify-content: space-between; font-size: 1rem; color: #61758a; background-color: #f0f5f9; height: 4rem; padding: 0 1rem; border-radius: 1rem;">
<div style="display: flex;">
<i class="ri-home-fill"></i>
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="../start.livemd">Home</a>
</div>
<div style="display: flex;">
<i class="ri-bug-fill"></i>
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="https://github.com/DockYard-Academy/curriculum/issues/new?assignees=&labels=&template=issue.md&title=MapSet Product Filters">Report An Issue</a>
</div>
<div style="display: flex;">
<i class="ri-arrow-left-fill"></i>
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="../exercises/mapset_drills.livemd">MapSet Drills</a>
</div>
<div style="display: flex;">
<a style="display: flex; color: #61758a; margin-right: 1rem;" href="../exercises/fibonacci_challenge.livemd">Fibonacci Sequence</a>
<i class="ri-arrow-right-fill"></i>
</div>
</div>

