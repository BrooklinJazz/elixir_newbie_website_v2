%{
  title: "Metric Conversion"
}
---
# Metric Conversion

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

## Metric Conversion

You're going to build an app to convert metric measurements such as **millimeters**, **centimeters**, **meters**, and **kilometers** according to the following table.

<!-- livebook:{"attrs":{"source":"[\n  [unit: :millimeter, value: 1, meter: 0.001],\n  [unit: :centimeter, value: 1, meter: 0.01],\n  [unit: :meter, value: 1, meter: 1],\n  [unit: :kilometer, value: 1, meter: 1000],\n] |> Kino.DataTable.new()","title":"Metric Conversion Table"},"kind":"Elixir.HiddenCell","livebook_object":"smart_cell"} -->

```elixir
[
  [unit: :millimeter, value: 1, meter: 0.001],
  [unit: :centimeter, value: 1, meter: 0.01],
  [unit: :meter, value: 1, meter: 1],
  [unit: :kilometer, value: 1, meter: 1000]
]
|> Kino.DataTable.new()
```

```elixir
1000 * 0.01 / 1000
```

Users provide values using `{from_unit, value}` tuples, and the desired unit to convert to.

<!-- livebook:{"force_markdown":true} -->

```elixir
Metric.convert({:centimeter, 100}, :meter)
1.0
```

The unit to convert from, and the unit to convert to can be either `:millimeter`, `:centimeter`, `:meter`, or `:kilometer`. The output should always be a **float**.

```elixir
defmodule Metric do
  @moduledoc """
  Documentation for `Metric`
  """

  @doc """
  Convert one measurement to another.
  We've used math values in the result

  ## Examples

    Convert unit to meters.

    iex> Metric.convert({:millimeter, 1}, :meter)
    0.001

    iex> Metric.convert({:centimeter, 1}, :meter)
    0.01

    iex> Metric.convert({:meter, 1}, :meter)
    1.0

    iex> Metric.convert({:kilometer, 1}, :meter)
    1000

    Convert meters to unit.

    iex> Metric.convert({:meter, 1}, :millimeter)
    1000.0

    iex> Metric.convert({:meter, 1}, :centimeter)
    100.0

    iex> Metric.convert({:meter, 1}, :meter)
    1.0

    iex> Metric.convert({:meter, 1}, :kilometer)
    0.001

    Convert unit to unit.

    iex> Metric.convert({:centimeter, 1000}, :kilometer)
    0.01

    iex> Metric.convert({:millimeter, 10}, :centimeter)
    1

    iex> Metric.convert({:kilometer, 10}, :centimeter)
    1000000
  """
  def convert(from, to) do
  end
end
```

## Commit Your Progress

Run the following in your command line from the curriculum folder to track and save your progress in a Git commit.
Ensure that you do not already have undesired or unrelated changes by running `git status` or by checking the source control tab in Visual Studio Code.

```
$ git checkout main
$ git checkout -b exercise-metric_conversion
$ git add .
$ git commit -m "finish metric conversion exercise"
$ git push origin exercise-metric_conversion
```

Create a pull request to your forked `main` branch. Please do not create a pull request to the DockYard Academy repository as this will spam our PR tracker.

**DockYard Academy Students Only:**

Notify your teacher by including `@BrooklinJazz` in your PR description to get feedback.

If you are interested in joining the next academy cohort, [sign up here](https://academy.dockyard.com/) to receive more news when it is available.

## Up Next

| Previous                                                         | Next                               |
| ---------------------------------------------------------------- | ---------------------------------: |
| [RPS Pattern Matching](../exercises/rps_pattern_matching.livemd) | [Guards](../reading/guards.livemd) |
