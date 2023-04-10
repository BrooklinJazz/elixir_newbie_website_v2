%{
  title: "Math With Protocols"
}
---
# Math With Protocols

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
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="https://github.com/DockYard-Academy/curriculum/issues/new?assignees=&labels=&template=issue.md&title=Math With Protocols">Report An Issue</a>
</div>
<div style="display: flex;">
<i class="ri-arrow-left-fill"></i>
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="../reading/protocols.livemd">Protocols</a>
</div>
<div style="display: flex;">
<a style="display: flex; color: #61758a; margin-right: 1rem;" href="../exercises/consumable_protocol.livemd">Consumable Protocol</a>
<i class="ri-arrow-right-fill"></i>
</div>
</div>

## Math With Protocols

In this exercise, you're going to create a `Math` protocol that handles adding and subtracting different data types.

Create a `Math` protocol implementation for **integers**, **strings**, and **lists**. You do not need to handle adding or subtracting different data types.

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
defprotocol Math do
  def add(value1, value2)
  def subtract(value1, value2)
end

defimpl Math, for: Integer do
  def add(integer1, integer2) do
    integer1 + integer2
  end

  def subtract(integer1, integer2) do
    integer1 - integer2
  end
end

defimpl Math, for: BitString do
  def add(string1, string2) do
    string1 <> string2
  end

  def subtract(string1, string2) do
    (String.split(string1, "") -- String.split(string2, ""))
    |> Enum.join()
  end
end

defimpl Math, for: List do
  def add(list1, list2) do
    list1 ++ list2
  end

  def subtract(list1, list2) do
    list1 -- list2
  end
end
```

</details>

Define implementations for the `Math` protocol as documented below.

```elixir
defprotocol Math do
  @doc """
  Add two integers, lists, or strings.

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

    iex> Math.add(%{}, %{})
    ** (Protocol.UndefinedError) protocol Math not implemented for %{} of type Map

    iex> Math.add({}, {})
    ** (Protocol.UndefinedError) protocol Math not implemented for {} of type Tuple
  """
  def add(value1, value2)

  @doc """
  Subtract two integers, lists, or strings.

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
    ** (Protocol.UndefinedError) protocol Math not implemented for 1.0 of type Float
  """
  def subtract(value1, value2)
end
```

## Commit Your Progress

DockYard Academy now recommends you use the latest [Release](https://github.com/DockYard-Academy/curriculum/releases) rather than forking or cloning our repository.

Run `git status` to ensure there are no undesirable changes.
Then run the following in your command line from the `curriculum` folder to commit your progress.

```
$ git add .
$ git commit -m "finish Math With Protocols exercise"
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
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="https://github.com/DockYard-Academy/curriculum/issues/new?assignees=&labels=&template=issue.md&title=Math With Protocols">Report An Issue</a>
</div>
<div style="display: flex;">
<i class="ri-arrow-left-fill"></i>
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="../reading/protocols.livemd">Protocols</a>
</div>
<div style="display: flex;">
<a style="display: flex; color: #61758a; margin-right: 1rem;" href="../exercises/consumable_protocol.livemd">Consumable Protocol</a>
<i class="ri-arrow-right-fill"></i>
</div>
</div>

