%{
  title: "Games: Guessing Game"
}
---
# Games: Guessing Game

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

## Games: Guessing Game

In your existing [Games](./games_setup.livemd) project, you're going to create a number guessing game which accepts user input through the
command line.

You should be able to start your project by running the following from the `game` folder in
the command line.

```
iex -S mix
```

Then you can start the game with the `Games.GuessingGame` module.

`Games.GuessingGame` should prompt the user to guess a number between `1` and `10`.

<!-- livebook:{"force_markdown":true} -->

```elixir
iex> Games.GuessingGame.play()
Enter your guess:
```

If the guess is correct, return a winning message.

<!-- livebook:{"force_markdown":true} -->

```elixir
Enter your guess: 10
Correct!
```

if the guess is incorrect, return a failing message.

<!-- livebook:{"force_markdown":true} -->

```elixir
Enter your guess: 10
Incorrect!
```

### Bonus: Re-Attempt

If the guess is incorrect, re-prompt the user to enter another guess until they succeed.

<!-- livebook:{"force_markdown":true} -->

```elixir
Enter your guess: 10
Incorrect!
Enter your guess: 5
Incorrect!
Enter your guess: 7
Correct!
```

### Bonus: High Or Low!

If the guess is too high or low, prompt the user with informative feedback.

<!-- livebook:{"force_markdown":true} -->

```elixir
Enter your guess: 10
Too High!
Enter your guess: 5
Too Low!
Enter your guess: 7
Correct!
```

## Commit Your Progress

Run the following in your command line from the curriculum folder to track and save your progress in a Git commit.
Ensure that you do not already have undesired or unrelated changes by running `git status` or by checking the source control tab in Visual Studio Code.

```
$ git checkout main
$ git checkout -b exercise-games_guessing_game
$ git add .
$ git commit -m "finish games guessing game exercise"
$ git push origin exercise-games_guessing_game
```

Create a pull request to your forked `main` branch. Please do not create a pull request to the DockYard Academy repository as this will spam our PR tracker.

**DockYard Academy Students Only:**

Notify your teacher by including `@BrooklinJazz` in your PR description to get feedback.

If you are interested in joining the next academy cohort, [sign up here](https://academy.dockyard.com/) to receive more news when it is available.

## Up Next

| Previous                                       | Next                                                                       |
| ---------------------------------------------- | -------------------------------------------------------------------------: |
| [Games Setup](../exercises/games_setup.livemd) | [Games Rock Paper Scissors](../exercises/games_rock_paper_scissors.livemd) |
