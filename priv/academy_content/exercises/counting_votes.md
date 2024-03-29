%{
  title: "Counting Votes"
}
---
# Counting Votes

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
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="https://github.com/DockYard-Academy/curriculum/issues/new?assignees=&labels=&template=issue.md&title=Counting Votes">Report An Issue</a>
</div>
<div style="display: flex;">
<i class="ri-arrow-left-fill"></i>
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="../exercises/named_number_lists.livemd">Named Number Lists</a>
</div>
<div style="display: flex;">
<a style="display: flex; color: #61758a; margin-right: 1rem;" href="../exercises/measurements.livemd">Measurements</a>
<i class="ri-arrow-right-fill"></i>
</div>
</div>

## Counting Votes

You're creating a voting system. Voters are entered in a list of votes. You will be given a specific vote to count.

For example, you might take a class vote of cats vs dogs vs birds to decide which animal is most popular.

<!-- livebook:{"break_markdown":true} -->

```mermaid
flowchart
D1[dogs]
D2[dogs]
D3[dogs]
C1[cats]
C2[cats]
B1[birds]
```

<!-- livebook:{"break_markdown":true} -->

We'll determine the number of votes for a single value. For example, there are `3` dogs.

<!-- livebook:{"break_markdown":true} -->

```mermaid
flowchart
D1[dogs]
D2[dogs]
D3[dogs]
C1[cats]
C2[cats]
B1[birds]

style D1 fill:lightgreen
style D2 fill:lightgreen
style D3 fill:lightgreen
```

<!-- livebook:{"break_markdown":true} -->

So we would return `3` votes for dogs.

<!-- livebook:{"force_markdown":true} -->

```elixir
Votes.count([:dogs, :dogs, :dogs, :cats, :cats, :birds], :dogs)
3
```

```elixir
defmodule Votes do
  @doc """
  Count the number of votes.

  ## Examples

    iex> Votes.count([:dogs, :dogs, :dogs, :cats], :dogs)
    3

    iex> Votes.count([:dogs, :dogs, :dogs, :cats], :cats)
    1

    iex> Votes.count([:apples, :oranges, :apples, :cats], :birds)
    0
  """
  def count(votes, vote) do
  end
end
```

## Bonus: Voter Tally

Counting each vote for dogs, cats, and birds becomes tedius. So, we instead want to determine the number of votes for each all at once.

```mermaid
flowchart
D1[dog]
D2[dog]
D3[dog]
C1[cat]
C2[cat]
B1[bird]

style D1 fill:lightgreen
style D2 fill:lightgreen
style D3 fill:lightgreen

style C1 fill:orange
style C2 fill:orange
style B1 fill:lightblue

```

There are `3` dogs, `2` cats, and `1` bird.

```elixir
defmodule VoterTally do
  @doc """
  Determine the number of votes for each option received.

  ## Examples

    iex> VoterTally.tally([:dog, :dog, :cat, :cat, :cat, :bird])
    %{dog: 2, cat: 3, bird: 1}
  """
  def tally(votes) do
  end
end
```

## Commit Your Progress

DockYard Academy now recommends you use the latest [Release](https://github.com/DockYard-Academy/curriculum/releases) rather than forking or cloning our repository.

Run `git status` to ensure there are no undesirable changes.
Then run the following in your command line from the `curriculum` folder to commit your progress.

```
$ git add .
$ git commit -m "finish Counting Votes exercise"
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
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="https://github.com/DockYard-Academy/curriculum/issues/new?assignees=&labels=&template=issue.md&title=Counting Votes">Report An Issue</a>
</div>
<div style="display: flex;">
<i class="ri-arrow-left-fill"></i>
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="../exercises/named_number_lists.livemd">Named Number Lists</a>
</div>
<div style="display: flex;">
<a style="display: flex; color: #61758a; margin-right: 1rem;" href="../exercises/measurements.livemd">Measurements</a>
<i class="ri-arrow-right-fill"></i>
</div>
</div>

