%{
  title: "Treasure Matching"
}
---
# Treasure Matching

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
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="https://github.com/DockYard-Academy/curriculum/issues/new?assignees=&labels=&template=issue.md&title=Treasure Matching">Report An Issue</a>
</div>
<div style="display: flex;">
<i class="ri-arrow-left-fill"></i>
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="../reading/advanced_pattern_matching.livemd">Advanced Pattern Matching</a>
</div>
<div style="display: flex;">
<a style="display: flex; color: #61758a; margin-right: 1rem;" href="../exercises/drill-patternmatching-replace-nils.livemd">Replacing Nils</a>
<i class="ri-arrow-right-fill"></i>
</div>
</div>

## Treasure Matching

In this exercise, you're going to use **pattern matching** to extract the `"jewel"`
string from the data provided and bind it to a `jewel` variable. The first exercise is complete for example.

```elixir
[_, _, _, jewel] = [1, 2, 3, "jewel"]
jewel
```

Use pattern matching to bind a `jewel` variable to the `"jewel"` string.

```elixir
[1, 2, 3, "jewel"]
```

```elixir
%{key1: "value", key2: "jewel"}
```

```elixir
%{1 => "jewel"}
```

```elixir
%{%{key: [1, 2, 3, 4, 5, {}]} => "jewel"}
```

```elixir
%{north: %{south: %{west: %{east: "jewel"}}}}
```

```elixir
[2, "jewel"]
```

```elixir
["jewel", 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
```

```elixir
[1, "jewel", 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
```

```elixir
[1, 2, "jewel", 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
```

```elixir
[[], [1, [2, "jewel"]]]
```

```elixir
"here is the jewel"
```

```elixir
{"jewel"}
```

```elixir
{"jewel", 1}
```

```elixir
{1, 2, "jewel"}
```

```elixir
["jewel"] ++ Enum.to_list(1..100)
```

```elixir
[key: "jewel"]
```

```elixir
[south: "jewel", east: {1, 2}]
```

```elixir
Enum.map(1..4, fn each -> (each == 2 && "jewel") || each end)
```

```elixir
Enum.map(1..4, &((&1 > 3 && "jewel") || &1))
```

## Commit Your Progress

DockYard Academy now recommends you use the latest [Release](https://github.com/DockYard-Academy/curriculum/releases) rather than forking or cloning our repository.

Run `git status` to ensure there are no undesirable changes.
Then run the following in your command line from the `curriculum` folder to commit your progress.

```
$ git add .
$ git commit -m "finish Treasure Matching exercise"
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
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="https://github.com/DockYard-Academy/curriculum/issues/new?assignees=&labels=&template=issue.md&title=Treasure Matching">Report An Issue</a>
</div>
<div style="display: flex;">
<i class="ri-arrow-left-fill"></i>
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="../reading/advanced_pattern_matching.livemd">Advanced Pattern Matching</a>
</div>
<div style="display: flex;">
<a style="display: flex; color: #61758a; margin-right: 1rem;" href="../exercises/drill-patternmatching-replace-nils.livemd">Replacing Nils</a>
<i class="ri-arrow-right-fill"></i>
</div>
</div>

