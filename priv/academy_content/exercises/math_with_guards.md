%{
  title: "Math With Guards"
}
---
# Math With Guards

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
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="https://github.com/DockYard-Academy/curriculum/issues/new?assignees=&labels=&template=issue.md&title=Math With Guards">Report An Issue</a>
</div>
<div style="display: flex;">
<i class="ri-arrow-left-fill"></i>
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="../exercises/with_points.livemd">With Points</a>
</div>
<div style="display: flex;">
<a style="display: flex; color: #61758a; margin-right: 1rem;" href="../exercises/rps_guards.livemd">Rock Paper Scissors Guards</a>
<i class="ri-arrow-right-fill"></i>
</div>
</div>

## Math

In this exercise, you're going to use guards to create a `Math` module that handles adding and subtracting **integers**, **strings**, and **lists**. You do not need to handling adding or subtracting different data types.

<!-- livebook:{"force_markdown":true} -->

```elixir
Math.add(1, 2)
3

Math.add("Hello, ", "World!")
"Hello, World!"

Math.add([1, 2], [3, 4])
[1, 2, 3, 4]

Math.subtract(10, 2)
8

Math.subtract("hello there", "hello ")
"there"

Math.subtract([1, 2, 3, 4], [1, 3])
[2, 4]
```

<details style="background-color: burlywood; padding: 1rem; margin: 1rem 0;">
<summary>Hint: Subtracting Strings</summary>

Consider converting your strings to a list, then subtract the two lists together then join your result back into a string.

</details>

<details style="background-color: lightgreen; padding: 1rem; margin: 1rem 0;">
<summary>Example Solution</summary>

```elixir
defmodule Math do
  def add(integer1, integer2) when is_integer(integer1) and is_integer(integer2) do
    integer1 + integer2
  end

  def add(list1, list2) when is_list(list1) and is_list(list2) do
    list1 ++ list2
  end

  def add(string1, string2) when is_binary(string1) and is_binary(string2) do
    string1 <> string2
  end

  def subtract(integer1, integer2) when is_integer(integer1) and is_integer(integer2) do
    integer1 - integer2
  end

  def subtract(list1, list2) when is_list(list1) and is_list(list2) do
    list1 -- list2
  end

  def subtract(string1, string2) when is_binary(string1) and is_binary(string2) do
    String.split(string1, "")
    |> subtract(String.split(string2, ""))
    |> Enum.join()
  end
end
```

</details>

Implement the `Math` module as documented below.

```elixir
defmodule Math do
  @moduledoc """
  Documentation for `Math`
  """

  @doc """
  Add two integers, strings, or lists.

  ## Examples

    iex> Math.add(2, 2)
    4
    iex> Math.add(4, 4)
    8

    Math.add([1, 2], [3, 4])
    [1, 2, 3, 4]
    Math.add([1, 2, 3], [4, 5, 6])
    [1, 2, 3, 4, 5, 6]

    iex> Math.add("abc", "def")
    "abcdef"
    iex> Math.add("123", "456")
    "123456"

    iex> Math.add(1.0, 2.0)
    ** (FunctionClauseError) no function clause matching in Math.add/2

    iex> Math.add(2, "2")
    ** (FunctionClauseError) no function clause matching in Math.add/2

    iex> Math.add({}, {})
    ** (FunctionClauseError) no function clause matching in Math.add/2

    iex> Math.add(%{}, %{})
    ** (FunctionClauseError) no function clause matching in Math.add/2
  """
  def add(value1, value2) do
  end

  @doc """
  Subtract two integers, strings, or lists.

  ## Examples

    iex> Math.subtract(10, 2)
    8
    iex> Math.subtract(20, 2)
    18

    iex> Math.subtract([1, 2], [1])
    [2]
    iex> Math.subtract([1, 2, 3, 4], [1, 3])
    [2, 4]

    iex> Math.subtract("abcd", "abc")
    "d"
    iex> Math.subtract("cbad", "abc")
    "d"
    iex> Math.subtract("abc", "xyz")
    "abc"
    iex> Math.subtract("abc", "xyza")
    "bc"

    iex> Math.subtract(1.0, 2.0)
    ** (FunctionClauseError) no function clause matching in Math.subtract/2

    iex> Math.subtract(2, "2")
    ** (FunctionClauseError) no function clause matching in Math.subtract/2

    iex> Math.subtract({}, {})
    ** (FunctionClauseError) no function clause matching in Math.subtract/2

    iex> Math.subtract(%{}, %{})
    ** (FunctionClauseError) no function clause matching in Math.subtract/2
  """
  def subtract(value1, value2) do
  end
end
```

## Commit Your Progress

DockYard Academy now recommends you use the latest [Release](https://github.com/DockYard-Academy/curriculum/releases) rather than forking or cloning our repository.

Run `git status` to ensure there are no undesirable changes.
Then run the following in your command line from the `curriculum` folder to commit your progress.

```
$ git add .
$ git commit -m "finish Math With Guards exercise"
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
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="https://github.com/DockYard-Academy/curriculum/issues/new?assignees=&labels=&template=issue.md&title=Math With Guards">Report An Issue</a>
</div>
<div style="display: flex;">
<i class="ri-arrow-left-fill"></i>
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="../exercises/with_points.livemd">With Points</a>
</div>
<div style="display: flex;">
<a style="display: flex; color: #61758a; margin-right: 1rem;" href="../exercises/rps_guards.livemd">Rock Paper Scissors Guards</a>
<i class="ri-arrow-right-fill"></i>
</div>
</div>

