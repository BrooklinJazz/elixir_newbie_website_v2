%{
  title: "ETS Warehouse"
}
---
# ETS Inventory Management

```elixir
Mix.install([
  {:kino, "~> 0.7.0", override: true},
  {:youtube, github: "brooklinjazz/youtube"},
  {:hidden_cell, github: "brooklinjazz/hidden_cell"}
])
```

## Navigation

[Return Home](../start.livemd)<span style="padding: 0 30px"></span>
[Report An Issue](https://github.com/DockYard-Academy/beta_curriculum/issues/new?assignees=&labels=&template=issue.md&title=)

## ETS Inventory

You're going to build an in-memory inventory management application using [:ets](https://elixir-lang.org/getting-started/mix-otp/ets.html).

<details style="background-color: lightgreen; padding: 1rem; margin: 1rem 0;">
<summary>Example Solution</summary>

```elixir
defmodule Inventory do
  def new(opts \\ []) do
    :ets.new(:inventory, opts)
  end

  def get_quantity(ref, item) do
    case :ets.lookup(ref, item) do
      [{_item, quantity}] -> quantity
      _ -> 0
    end
  end

  def store(ref, item, quantity) do
    existing_quantity = get_quantity(ref, item)
    :ets.insert(ref, {item, quantity + existing_quantity})
  end
end
```

</details>

Implement the `Inventory` module as documented.

```elixir
defmodule Inventory do
  @moduledoc """
  Documentation for `Inventory`

  ## Examples

      Single quantity.

      iex> ref = Inventory.new()
      iex> Inventory.store(ref, :apples, 5)
      iex> Inventory.get_quantity(ref, :apples)
      5

      Multiple stores.

      iex> ref = Inventory.new()
      iex> Inventory.store(ref, :apples, 5)
      iex> Inventory.store(ref, :apples, 2)
      iex> Inventory.get_quantity(ref, :apples)
      7
  """
  @doc """
  Create a new Inventory :ets table.

  ## Examples

      iex> ref = Inventory.new()
      iex> is_reference(ref)
      true
  """
  def new() do
  end

  @doc """
  Retrieve the current quantity of an item in inventory.

  ## Examples
        
      iex> ref = Inventory.new()
      iex> Inventory.get_quantity(ref, :apples)
      0
  """
  def get_quantity(ref, item) do
  end

  @doc """
  Store an item in inventory.
  If item exists, add amount to existing total.

  ## Examples

      iex> ref = Inventory.new()
      iex> Inventory.store(ref, :apples, 5)
      true
  """
  def store(ref, item, quantity) do
  end
end
```

## Bonus: Warehouse

You're going to build a warehouse management application using `:ets`. Now, instead of having a single quantity for each item, every item can be stored in multiple boxes, each with their own quantity of that item.

<details style="background-color: burlywood; padding: 1rem; margin: 1rem 0;">
<summary>Hint</summary>

Consider using the `:duplicate_bag` [Table Type](https://elixirschool.com/en/lessons/storage/ets#table-types-2).

</details>

<details style="background-color: lightgreen; padding: 1rem; margin: 1rem 0;">
<summary>Example Solution</summary>

```elixir
defmodule Warehouse do
  def new() do
    :ets.new(:warehouse, [:duplicate_bag])
  end

  def get_quantity(ref, item) do
    :ets.lookup(ref, item)
  end

  def store(ref, item, quantity) do
    :ets.insert(ref, {item, quantity})
  end
end
```

</details>

```elixir
defmodule Warehouse do
  @moduledoc """
  Documentation for `Warehouse`

  ## Examples

      Existing quantity.

      iex> ref = Warehouse.new()
      iex> Warehouse.store(ref, :apples, 5)
      iex> Warehouse.get_boxes(ref, :apples)
      [apples: 5]

      Multiple Boxes.

      iex> ref = Warehouse.new()
      iex> Warehouse.store(ref, :apples, 1)
      iex> Warehouse.store(ref, :apples, 3)
      iex> Warehouse.get_boxes(ref, :apples)
      [apples: 1, apples: 3]
  """

  @doc """
  Create a new Warehouse :ets table.

  ## Examples

      iex> ref = Warehouse.new()
      iex> is_reference(ref)
      true
  """
  def new(opts \\ []) do
  end

  @doc """
  Retrieve all boxes of an item and the associated quantity in each box.

  ## Examples

      iex> ref = Warehouse.new()
      iex> Warehouse.get_boxes(ref, :apples)
      []
  """
  def get_boxes(ref, item) do
  end

  @doc """
  Store an item in the warehouse.
  If item exists, add amount to existing total.

    ## Examples

      iex> ref = Warehouse.new()
      iex> Warehouse.store(ref, :apples, 5)
      true
  """
  def store(ref, item, quantity) do
  end
end
```

## Commit Your Progress

Run the following in your command line from the curriculum folder to track and save your progress in a Git commit.
Ensure that you do not already have undesired or unrelated changes by running `git status` or by checking the source control tab in Visual Studio Code.

```
$ git checkout main
$ git checkout -b exercise-inventory_management
$ git add .
$ git commit -m "finish inventory management exercise"
$ git push origin exercise-inventory_management
```

Create a pull request to your forked `main` branch. Please do not create a pull request to the DockYard Academy repository as this will spam our PR tracker.

**DockYard Academy Students Only:**

Notify your teacher by including `@BrooklinJazz` in your PR description to get feedback.

If you are interested in joining the next academy cohort, [sign up here](https://academy.dockyard.com/) to receive more news when it is available.

## Up Next

| Previous                                           | Next                                                                 |
| -------------------------------------------------- | -------------------------------------------------------------------: |
| [Agent Journal](../exercises/agent_journal.livemd) | [Advanced Score Tracker](../exercises/advanced_score_tracker.livemd) |

