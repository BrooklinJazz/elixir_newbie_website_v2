%{
  title: "With Points"
}
---
# With Points

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
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="https://github.com/DockYard-Academy/curriculum/issues/new?assignees=&labels=&template=issue.md&title=With Points">Report An Issue</a>
</div>
<div style="display: flex;">
<i class="ri-arrow-left-fill"></i>
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="../exercises/message_validation.livemd">Message Validation</a>
</div>
<div style="display: flex;">
<a style="display: flex; color: #61758a; margin-right: 1rem;" href="../exercises/math_with_guards.livemd">Math With Guards</a>
<i class="ri-arrow-right-fill"></i>
</div>
</div>

## With Points

You're going to create a `Points` module which determines the total score of each team in a generic game after three rounds.

<!-- livebook:{"force_markdown":true} -->

```elixir
game = %{
  team1_name: "Team Team",
  team2_name: "Exersport",
  round1: %{
    team1: 10,
    team2: 20
  },
  round2: %{
    team1: 30,
    team2: 10
  },
  round3: %{
    team1: 25,
    team2: 30
  }
}

Points.tally(game)
%{"Team Team" => 65, "Exersport" => 60}
```

Use `with` to ensure the following:

* If the `game` provided does not have a `:team1_name` or `team2_name` keys return `{:error, :invalid}`.
* If the `game` does not have a `round1`, `round2`, or `round3` key, each with `:team1` and `:team2` keys return `{:error, :invalid}`.

<details style="background-color: lightgreen; padding: 1rem; margin: 1rem 0;">
<summary>Example Solution</summary>

```elixir
defmodule Points do
  def tally(game) do
    with %{team1_name: team1, team2_name: team2} <- game,
         %{round1: %{team1: t1r1, team2: t2r1}} <- game,
         %{round2: %{team1: t1r2, team2: t2r2}} <- game,
         %{round3: %{team1: t1r3, team2: t2r3}} <- game do
      %{}
      |> Map.put(team1, t1r1 + t1r2 + t1r3)
      |> Map.put(team2, t2r1 + t2r2 + t2r3)
    else
      error -> 
        IO.inspect(error)
        {:error, :invalid}
    end
  end
end
```

</details>

Enter your solution below.

```elixir
defmodule Points do
  @doc """
  Tally points in a generic three round game.

  A valid game will return the teams and their total scores in a map.

      iex> game = %{team1_name: "Team Team", team2_name: "Exersport", round1: %{team1: 10, team2: 20}, round2: %{team1: 30, team2: 10}, round3: %{team1: 25, team2: 30}}
      iex> Points.tally(game)
      %{"Team Team" => 65, "Exersport" => 60}

  The `game` must have a `team1_name` and `team2_name` keys.

      iex> Points.tally(%{no_team_names: true})
      {:error, :invalid}

  The `game` must have a `round1`, `round2`, and `round3` keys.

      iex> Points.tally(%{team1_name: "name1", team2_name: "name2"})
      {:error, :invalid}
  """
  def tally(game) do
  end
end
```

## Commit Your Progress

DockYard Academy now recommends you use the latest [Release](https://github.com/DockYard-Academy/curriculum/releases) rather than forking or cloning our repository.

Run `git status` to ensure there are no undesirable changes.
Then run the following in your command line from the `curriculum` folder to commit your progress.

```
$ git add .
$ git commit -m "finish With Points exercise"
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
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="https://github.com/DockYard-Academy/curriculum/issues/new?assignees=&labels=&template=issue.md&title=With Points">Report An Issue</a>
</div>
<div style="display: flex;">
<i class="ri-arrow-left-fill"></i>
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="../exercises/message_validation.livemd">Message Validation</a>
</div>
<div style="display: flex;">
<a style="display: flex; color: #61758a; margin-right: 1rem;" href="../exercises/math_with_guards.livemd">Math With Guards</a>
<i class="ri-arrow-right-fill"></i>
</div>
</div>

