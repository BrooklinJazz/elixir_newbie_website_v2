%{
  title: "Games: Supervised Score Tracker"
}
---
# Games: Supervised Score Tracker

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

## Games: Supervised Score Tracker

Refactor your existing [Games: Score Tracker](./games_score_tracker.livemd) module to be a named process and configure it with your [Games Supervisor](./games_supervisor_setup.livemd).
Ensure your existing [Games: Score Tracker](./games_score_tracker.livemd) test suite continue to pass. You may need to alter it slightly now
that `Games.ScoreTracker` is a named process.

If you don't already have a `ScoreTracker` module you can use the one below.

```elixir
defmodule ScoreTracker do
  use GenServer

  def start_link(opts) do
    name = Keyword.get(opts, :name, __MODULE__)
    GenServer.start_link(__MODULE__, [], name: name)
  end

  def add(pid \\ __MODULE__, points) do
    GenServer.call(pid, {:add, points})
  end

  def get(pid \\ __MODULE__) do
    GenServer.call(pid, :get)
  end

  @impl true
  def init(_opts) do
    {:ok, 0}
  end

  @impl true
  def handle_call(:get, _from, state) do
    {:reply, state, state}
  end

  @impl true
  def handle_call({:add, points}, _from, state) do
    {:reply, state + points, state + points}
  end
end
```

### Bonus: Track Scores

Whenever a player wins a round of [Guessing Game](./games_guessing_game.livemd), [RockPaperScissors](./games_rock_paper_scissors.livemd), or [Wordle](./games_wordle.livemd), increase the player's score.

**(Optional)** Consider printing the current score every time you increment it to make debugging and visual display easier.
**(Optional)** Each game can be worth the same amount of points, or you might vary the points depending on the game.

<!-- livebook:{"break_markdown":true} -->

### Bonus: Score Menu

In the previously implemented [Games.Menu](./games_menu.livemd) module, implement a `Total Score` option which prints the current total score. It should use the `Games.ScoreTracker` module to get the current score.

```
$ ./games
Select a game:
1. Guessing Game
2. Rock Paper Scissors
3. Wordle
4. Total Score
Select: 4
Your current session score: 3
```

## Commit Your Progress

Run the following in your command line from the curriculum folder to track and save your progress in a Git commit.
Ensure that you do not already have undesired or unrelated changes by running `git status` or by checking the source control tab in Visual Studio Code.

```
$ git checkout main
$ git checkout -b exercise-games_supervised_score_tracker
$ git add .
$ git commit -m "finish games supervised score tracker exercise"
$ git push origin exercise-games_supervised_score_tracker
```

Create a pull request to your forked `main` branch. Please do not create a pull request to the DockYard Academy repository as this will spam our PR tracker.

**DockYard Academy Students Only:**

Notify your teacher by including `@BrooklinJazz` in your PR description to get feedback.

If you are interested in joining the next academy cohort, [sign up here](https://academy.dockyard.com/) to receive more news when it is available.

## Up Next

| Previous                                                             | Next                           |
| -------------------------------------------------------------------- | -----------------------------: |
| [Games Supervisor Setup](../exercises/games_supervisor_setup.livemd) | [Task](../reading/task.livemd) |

