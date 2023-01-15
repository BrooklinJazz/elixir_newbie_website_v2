%{
  title: "Games: Rock Paper Scissors"
}
---
# Games: Rock Paper Scissors

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

## Games: Rock Paper Scissors

In your existing [Games](./games_setup.livemd) project, you're going to create a rock paper scissors game where players will play against an AI which randomly chooses
rock, paper, or scissors.

You should be able to start your project by running the following from the `game` folder in
the command line.

```
iex -S mix
```

Then you can start the rock paper scissors game with a `Games.RockPaperScissors` module.
The game should prompt the user for a choice of `"rock"`, `"paper"`, or `"scissors"`.

<!-- livebook:{"force_markdown":true} -->

```elixir
iex> Games.RockPaperScissors.play()
(rock/paper/scissors): scissors
```

The game should generate a random AI choice of `"rock"` , `"paper"`, or `"scissors"`, then prompt the user with feedback if they win, lose, or draw.

<!-- livebook:{"force_markdown":true} -->

```elixir
# randomly generated paper for the opponent
(rock/paper/scissors): scissors
"You win! scissors beats paper."

# randomly generated scissors for the opponent
(rock/paper/scissors): paper
"You lose! scissors beats paper."

# randomly generated rock for the opponent
(rock/paper/scissors): rock
"It's a tie!"
```

## Commit Your Progress

Run the following in your command line from the curriculum folder to track and save your progress in a Git commit.
Ensure that you do not already have undesired or unrelated changes by running `git status` or by checking the source control tab in Visual Studio Code.

```
$ git checkout main
$ git checkout -b exercise-games_rock_paper_scissors
$ git add .
$ git commit -m "finish games rock paper scissors exercise"
$ git push origin exercise-games_rock_paper_scissors
```

Create a pull request to your forked `main` branch. Please do not create a pull request to the DockYard Academy repository as this will spam our PR tracker.

**DockYard Academy Students Only:**

Notify your teacher by including `@BrooklinJazz` in your PR description to get feedback.

If you are interested in joining the next academy cohort, [sign up here](https://academy.dockyard.com/) to receive more news when it is available.

## Up Next

| Previous                                                       | Next                               |
| -------------------------------------------------------------- | ---------------------------------: |
| [Games Guessing Game](../exercises/games_guessing_game.livemd) | [ExUnit](../reading/exunit.livemd) |
