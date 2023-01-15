%{
  title: "Doctests"
}
---
# Doctests

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

## Setup

Ensure you type the `ea` keyboard shortcut to evaluate all Elixir cells before starting. Alternatively you can evaluate the Elixir cells as you read.

## Doctests

We use the `@moduledoc` and `@doc` module attributes to document our code in a mix project.
By documenting our project, we explain to other developers the purpose of our code.

`@moduledoc` contains documentation for the entire module, and `@doc` documents the function below it.

When we created the `Math` mix project, it used the `@doc` and `@moduledoc` module attribute to document the main `math.ex` module.

<!-- livebook:{"force_markdown":true} -->

```elixir
defmodule Math do
  @moduledoc """
  Documentation for `Math`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Math.hello()
      :world

  """
  def hello do
    :world
  end
end

```

Notice the `Examples` section, which simulates an [IEx](https://hexdocs.pm/iex/IEx.html) shell.Any line with `iex>` is a Doctest. Doctests are run by the corresponding test file `math_test.exs` using the [doctest/2](https://hexdocs.pm/ex_unit/ExUnit.DocTest.html#doctest/2) macro.

<!-- livebook:{"force_markdown":true} -->

```elixir
ExUnit.start(auto_run: false)

defmodule MathTest do
  use ExUnit.Case
  doctest Math
end

ExUnit.run()
```

Doctests are generally not as comprehensive as typical testing and are not a full replacement.
However, they can be a great way to test the input and output of your code and ensure the documentation remains up to date.

Generally, Doctests go in an `Examples` section.
You can write multiple Doctests like so.

<!-- livebook:{"force_markdown":true} -->

```elixir
  @doc """
  add data types.

  ## Examples

      iex> Math.add(1, 1)
      2

      iex> Math.add(2.1, 2.1)
      4.2
  """
```

<!-- livebook:{"break_markdown":true} -->

### Your Turn

Previously you converted a `Math` module into a mix project in the [ExUnit with Mix](./exunit_with_mix.livemd) section.

Add doctests to the `Math` module in the `math.ex` file for both the `add/2` and `subtract/2` function. Include an example for each data type (integers, floats, strings, lists, maps, keyword lists).

## Further Reading

Consider the following resource(s) to deepen your understanding of the topic.

* [ElixirSchools: Documentation](https://elixirschool.com/en/lessons/basics/documentation)
* [elixir-lang: doctests](https://elixir-lang.org/getting-started/mix-otp/docs-tests-and-with.html#doctests)

## Commit Your Progress

Run the following in your command line from the curriculum folder to track and save your progress in a Git commit.
Ensure that you do not already have undesired or unrelated changes by running `git status` or by checking the source control tab in Visual Studio Code.

```
$ git checkout main
$ git checkout -b exercise-doctests
$ git add .
$ git commit -m "finish doctests section"
$ git push origin exercise-doctests
```

Create a pull request to your forked `main` branch. Please do not create a pull request to the DockYard Academy repository as this will spam our PR tracker.

**DockYard Academy Students Only:**

Notify your teacher by including `@BrooklinJazz` in your PR description to get feedback.

If you are interested in joining the next academy cohort, [sign up here](https://academy.dockyard.com/) to receive more news when it is available.

## Up Next

| Previous                                         | Next                                     |
| ------------------------------------------------ | ---------------------------------------: |
| [Games Wordle](../exercises/games_wordle.livemd) | [Typespecs](../reading/typespecs.livemd) |
