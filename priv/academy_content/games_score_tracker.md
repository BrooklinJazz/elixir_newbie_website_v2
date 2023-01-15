%{
  title: "Games: Score Tracker"
}
---
# Games: Score Tracker

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

## Games: Score Tracker

Previously you created a [Score Tracker](./score_tracker.livemd) [GenServer](https://hexdocs.pm/elixir/GenServer.html) which can track and add to a score.

You're going to re-create this score tracker in a `Games.ScoreTracker` module.
You may use this `Games.ScoreTracker` module in future exercises to keep track of a score.

<!-- livebook:{"force_markdown":true} -->

```elixir
{:ok, pid} = Games.ScoreTracker.start_link([])
Games.ScoreTracker.add(pid, 10)
10 = Games.ScoreTracker.get(pid)
Games.ScoreTracker.add(pid, 20)
30 = Games.ScoreTracker.get(pid)
```

Implement the `Games.ScoreTracker` in your existing [Games](./games_setup.livemd) project. Create a full test suite to ensure it behaves as expected.

## Commit Your Progress

Run the following in your command line from the curriculum folder to track and save your progress in a Git commit.
Ensure that you do not already have undesired or unrelated changes by running `git status` or by checking the source control tab in Visual Studio Code.

```
$ git checkout main
$ git checkout -b exercise-games_score_tracker
$ git add .
$ git commit -m "finish games score tracker exercise"
$ git push origin exercise-games_score_tracker
```

Create a pull request to your forked `main` branch. Please do not create a pull request to the DockYard Academy repository as this will spam our PR tracker.

**DockYard Academy Students Only:**

Notify your teacher by including `@BrooklinJazz` in your PR description to get feedback.

If you are interested in joining the next academy cohort, [sign up here](https://academy.dockyard.com/) to receive more news when it is available.

## Up Next

| Previous                           | Next                                                 |
| ---------------------------------- | ---------------------------------------------------: |
| [Stack](../exercises/stack.livemd) | [Metaprogramming](../reading/metaprogramming.livemd) |

