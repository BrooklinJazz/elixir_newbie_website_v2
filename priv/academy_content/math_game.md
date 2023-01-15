%{
  title: "Math Game"
}
---
# Math Game

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

## Math Game

Build a mental math game using LiveView.

The game should:

* Prompt the user with a random math addition question: i.e. `2 + 3`.
* Have a text input the user can enter their answer into.
* Have a button users can submit their answer with.
* Track the score of the user, and increment the score with each correct answer.

<!-- livebook:{"break_markdown":true} -->

### Bonus: Submit Answer On Enter

Make it so that players can submit their answer without pressing a button, but can alternatively press the <kbd>Enter</kbd> key to submit their answer.

<!-- livebook:{"break_markdown":true} -->

### Bonus: Track Highscores

Track the current player scores. You might choose to persist this in memory or using a Database.
Display the current player scores in the math game. You should be able to open two clients, and each player's score will be tracked and displayed in real-time.

## Commit Your Progress

Run the following in your command line from the curriculum folder to track and save your progress in a Git commit.
Ensure that you do not already have undesired or unrelated changes by running `git status` or by checking the source control tab in Visual Studio Code.

```
$ git checkout main
$ git checkout -b exercise-math_game
$ git add .
$ git commit -m "finish math game exercise"
$ git push origin exercise-math_game
```

Create a pull request to your forked `main` branch. Please do not create a pull request to the DockYard Academy repository as this will spam our PR tracker.

**DockYard Academy Students Only:**

Notify your teacher by including `@BrooklinJazz` in your PR description to get feedback.

If you are interested in joining the next academy cohort, [sign up here](https://academy.dockyard.com/) to receive more news when it is available.

## Up Next

| Previous                               | Next                                             |
| -------------------------------------- | -----------------------------------------------: |
| [LiveView](../reading/liveview.livemd) | [Rubber Ducky](../exercises/rubber_ducky.livemd) |
