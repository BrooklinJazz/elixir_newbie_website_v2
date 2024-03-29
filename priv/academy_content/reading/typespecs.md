%{
  title: "Typespecs"
}
---
# Typespecs

```elixir
Mix.install([
  {:jason, "~> 1.4"},
  {:kino, "~> 0.9", override: true},
  {:youtube, github: "brooklinjazz/youtube"},
  {:hidden_cell, github: "brooklinjazz/hidden_cell"}
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
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="https://github.com/DockYard-Academy/curriculum/issues/new?assignees=&labels=&template=issue.md&title=Typespecs">Report An Issue</a>
</div>
<div style="display: flex;">
<i class="ri-arrow-left-fill"></i>
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="../reading/doctests.livemd">Doctests</a>
</div>
<div style="display: flex;">
<a style="display: flex; color: #61758a; margin-right: 1rem;" href="../reading/exdoc.livemd">ExDoc</a>
<i class="ri-arrow-right-fill"></i>
</div>
</div>

## Typespecs

Elixir comes with a notation for declaring types and specifications.

We can use the `@spec` module attribute to define the signature of a function.

For example, we could add a `@spec` for the `math` module's `add/2` function.

`@spec` defines the function name, then the types for each argument, then the return value type separated
by the `::` symbol.

```elixir
defmodule IntegerTypespecExample do
  @spec double(integer()) :: integer()
  def double(my_int) do
    my_int * 2
  end
end
```

### Basic Types

`number()` is a built-in type. Here are a few other common types you may find useful.

```
any()
atom()
map()
tuple()
list()
list(type) # a list where the elements are particular type
float()
integer()
number() # both integers and floats
String.t() # the string type
```

For a full list of built in types you can see the [Basic Types](https://hexdocs.pm/elixir/typespecs.html#basic-types)
section of the Elixir Typespecs documentation.

<!-- livebook:{"break_markdown":true} -->

### Your Turn

In the `Adder` module below, create an `@spec` for integers with the `add/2` function.

```elixir
defmodule Adder do
  def add(integer1, integer2) do
    integer1 + integer2
  end
end
```

### Combing Types

The `|` symbol allows us to combine multiple types. For example we can combine `integer()` and `float()` in our `Number` module

```elixir
defmodule NumberTypespecExample do
  @spec double(integer() | float()) :: integer() | float()
  def double(number) do
    number * 2
  end
end
```

### Custom Types

We can use `@type` to define custom types. We give our custom type a name then define it's value after the `::` symbol. Once we've defined a custom type, we can use it anywhere in our application. This way we don't have to repeatedly define the same types over and over.

Below, we've defined a custom `my_number()` type for the sake of example. However, in the real-world we should use the built-in `number()` type instead.

```elixir
defmodule CustomTypeExample do
  @type my_number() :: integer() | float()

  @spec double(my_number()) :: my_number()
  def double(number) do
    number * 2
  end
end
```

### Your Turn

In the `Math` module below, define a custom `@type` `input()` that can be a list, integer, or string.

```elixir
defmodule Math do
end
```

## Dialyzer

Dialyzer is a static analysis tool used to provide warnings about your code, such as mismatched types,
unreachable code, and other common issues.

To use Dialyzer, we install [Dialyxir](https://github.com/jeremyjh/dialyxir), which provides conveniences for working with Dialyzer in an Elixir project.

We can add `:dialyxir` as a dependency in the `mix.exs` file in any mix project.

<!-- livebook:{"force_markdown":true} -->

```elixir
 defp deps do
    [
      {:dialyxir, "~> 1.0", only: :dev, runtime: false}
    ]
  end
```

Make sure to install dependencies.

```
$ mix deps.get
```

We can then run Dialyzer by running the following in the command line.

```
$ mix dialyzer
...
Total errors: 0, Skipped: 0, Unnecessary Skips: 0
done in 0m0.82s
```

<!-- livebook:{"break_markdown":true} -->

### Your Turn

Previously you converted a `Math` module into a mix project in the [ExUnit with Mix](./exunit_with_mix.livemd) section.

Add dialyxir as a dependency to your mix.exs file in the math project.

<!-- livebook:{"force_markdown":true} -->

```elixir
defp deps do
  [
    {:dialyxir, "~> 1.0", only: :dev, runtime: false}
  ]
end
```

Add typespecs for `Math.add/2` and `Math.subtract/2` for lists, strings, and integers.
Once complete, if you include a failing example in your `Math` module like so, you should see a warning in the Visual Studio Code editor.

<!-- livebook:{"force_markdown":true} -->

```elixir
Math.add(%{}, %{})
```

Run dialyzer and you should see some errors because the typespec catches that `%{}` is an invalid input.

```
$ mix dialyzer
```

## Commit Your Progress

DockYard Academy now recommends you use the latest [Release](https://github.com/DockYard-Academy/curriculum/releases) rather than forking or cloning our repository.

Run `git status` to ensure there are no undesirable changes.
Then run the following in your command line from the `curriculum` folder to commit your progress.

```
$ git add .
$ git commit -m "finish Typespecs reading"
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
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="https://github.com/DockYard-Academy/curriculum/issues/new?assignees=&labels=&template=issue.md&title=Typespecs">Report An Issue</a>
</div>
<div style="display: flex;">
<i class="ri-arrow-left-fill"></i>
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="../reading/doctests.livemd">Doctests</a>
</div>
<div style="display: flex;">
<a style="display: flex; color: #61758a; margin-right: 1rem;" href="../reading/exdoc.livemd">ExDoc</a>
<i class="ri-arrow-right-fill"></i>
</div>
</div>

