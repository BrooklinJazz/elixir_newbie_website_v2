%{
  title: "Replacing nils"
}
---
# Replacing Nils

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
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="https://github.com/DockYard-Academy/curriculum/issues/new?assignees=&labels=&template=issue.md&title=Replacing Nils">Report An Issue</a>
</div>
<div style="display: flex;">
<i class="ri-arrow-left-fill"></i>
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="../exercises/treasure_matching.livemd">Treasure Matching</a>
</div>
<div style="display: flex;">
<a style="display: flex; color: #61758a; margin-right: 1rem;" href="../exercises/rps_pattern_matching.livemd">Rock Paper Scissors Pattern Matching</a>
<i class="ri-arrow-right-fill"></i>
</div>
</div>

## Purpose

This is a guest exercise written by Quentin Crain.

This is a *drill* exercise:

> *Drill* exercises are meant to provide practise of Elixir's
> syntax and important language modules so developers can
> type them out as fast as possible.
> The problem should not be conceptually difficult to
> facilitate this goal.
> 
> Developers need to commit both Elixir's syntax and core
> modules/functions to (working) memory so that when writing
> their code the developer is not slowed down having to
> remember the syntax or which module function to use. This
> is analogous to knowing how to spell and the grammar of
> your (human) language.

In this particular iteration of this problem, the goal is
to practise writing/using functions with pattern matching
in the functions' heads.

To develop familiarity with functions and pattern matching,
you will replace `nil` values in a list with values from a
second list at the same index.

For example:

```elixir
list1 = [0, nil, 2, 3, nil]
list2 = [:a, :b, :c, :d, :e]

ReplaceNils.replace(list1, list2)
[0, :b, 2, 3, :e]
```

You can assume the lists are of the same length.

Implement the `ReplaceNils` module as below:

```elixir
defmodule ReplaceNils do
  @moduledoc """
  Replace Nils
  """

  @doc """
  replace nil values in the first list with values from the second list in the same position.
  """
  def replace(input1, input2) do
    nil
  end
end
```

Here are some additional test data to think about:

<!-- livebook:{"force_markdown":true} -->

```elixir
Testcase 1:
  Input1:   [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  Input2:   [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]
  Expected: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

Testcase 2:
  Input1:   [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]
  Input2:   [:a, :b, :c, :d, :e, :f, :g, :h, :i, :j]
  Expected: [:a, :b, :c, :d, :e, :f, :g, :h, :i, :j]

Testcase 3:
  Input1: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  Input2: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

Testcase 4:
  Input1: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  Input2: [:a, :b, :c, :d, :e, :f, :g, :h, :i, :j]

Testcase 5:
  [1, 2, 3, nil, nil, 6, 7, nil, 9, 10]
  [:a, :b, :c, :d, :e, :f, :g, :h, :i, :j]
```

Here are some example solutions:

<details style="background-color: lightgreen; padding: 1rem; border-radius: 0.5rem; margin: 1rem 0;">
<summary>Example Solution 1</summary>

```elixir
defmodule ReplaceNils do
  def replace([i1|input1], [i2|input2]) do
    if input1 == [] do
      if i1 == nil, do: [i2], else: [i1]
    else
      [if i1 == nil, do: [i2], else: [i1]] ++ replace(input1, input2)
    end
  end
end
```

</details>

<details style="background-color: lightgreen; padding: 1rem; border-radius: 0.5rem; margin: 1rem 0;">
<summary>Example Solution 2</summary>

```elixir
defmodule ReplaceNils do
  def replace([a|as], [b|bs]) do
    case as do
      [] -> [a || b]
      _  -> [a || b] ++ replace(as, bs)
    end
  end
end
```

</details>

<details style="background-color: lightgreen; padding: 1rem; border-radius: 0.5rem; margin: 1rem 0;">
<summary>Example Solution 3</summary>

```elixir
defmodule ReplaceNils do
  def replace(as, bs, acc \\ [])

  def replace([], [], acc), do: Enum.reverse(acc)
  def replace([nil|as], [b|bs], acc), do: replace(as, bs, [b|acc])
  def replace([a|as], [_b|bs], acc), do: replace(as, bs, [a|acc])
end
```

</details>

## Commit Your Progress

DockYard Academy now recommends you use the latest [Release](https://github.com/DockYard-Academy/curriculum/releases) rather than forking or cloning our repository.

Run `git status` to ensure there are no undesirable changes.
Then run the following in your command line from the `curriculum` folder to commit your progress.

```
$ git add .
$ git commit -m "finish Replacing Nils exercise"
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
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="https://github.com/DockYard-Academy/curriculum/issues/new?assignees=&labels=&template=issue.md&title=Replacing Nils">Report An Issue</a>
</div>
<div style="display: flex;">
<i class="ri-arrow-left-fill"></i>
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="../exercises/treasure_matching.livemd">Treasure Matching</a>
</div>
<div style="display: flex;">
<a style="display: flex; color: #61758a; margin-right: 1rem;" href="../exercises/rps_pattern_matching.livemd">Rock Paper Scissors Pattern Matching</a>
<i class="ri-arrow-right-fill"></i>
</div>
</div>

