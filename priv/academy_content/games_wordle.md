%{
  title: "Games: Wordle Application"
}
---
# Games: Wordle

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

## Games: Wordle

In your existing [Games](./games_setup.livemd) project, you're going to create a Wordle game.

Wordle is a popular game where players get six attempts to guess a word.
They are given feedback clues to guess the word.

* **Green** if the letter is in the word and in the correct spot.
* **Yellow** if the letter is in the word but in the incorrect spot.
* **Gray** if the letter is not in the word.

For example for the word "TOAST" the guess "TARTS" would be

```mermaid
flowchart LR
style 1 fill:green
style 2 fill:yellow
style 3 fill:gray
style 4 fill:yellow
style 5 fill:yellow

1[T] --- 2[A] --- 3[R] --- 4[T] --- 5[S]
```

You should be able to start your project by running the following from the `game` folder in
the command line.

```
iex -S mix
```

Given an answer and a guess, your `Games.Wordle` module will provide feedback as a list of color atoms `:green`, `:yellow`, and `:grey`.

<!-- livebook:{"force_markdown":true} -->

```elixir
                         #answer   #guess
iex> Games.Wordle.feedback("aaaaa", "aaaaa")
[:green, :green, :green, :green, :green]

iex> Games.Wordle.feedback("aaaaa", "aaaab")
[:green, :green, :green, :green, :grey]

iex> Games.Wordle.feedback("abdce", "edcba")
[:yellow, :yellow, :yellow, :yellow, :yellow]

# If there are duplicate characters in the guess prioritize exact matches.
iex> Games.Wordle.feedback("aaabb", "xaaaa")
[:grey, :green, :green, :yellow, :grey]
```

Test and implement a `Games.Wordle` module in your [Games](./games_setup.livemd) project.

<!-- livebook:{"break_markdown":true} -->

### Play

Use the IEx shell to start a game of Wordle. This should prompt the user to guess a five letter word.

```
iex> Games.Wordle.play()
Enter a five letter word:  
```

Randomly generate a word for the wordle game. You might randomly retrieve a word from a list of words such as `["toast", "tarts", "hello", "beats"]`.

Retrieve user input and provide feedback based on their guess. For example, this would be the output if the word `toast` were randomly generated.

```
Enter a give letter word: tarts
[:green, :yellow, :grey, :yellow, :yellow]
```

<!-- livebook:{"break_markdown":true} -->

### Bonus: Six Guesses

After six guesses, the player should lose the game if they do not get the correct answer.

<!-- livebook:{"break_markdown":true} -->

### Bonus: Color Feedback

Use [IO.ANSI](https://hexdocs.pm/elixir/IO.ANSI.html) to provide actual colored feedback.

## Commit Your Progress

Run the following in your command line from the curriculum folder to track and save your progress in a Git commit.
Ensure that you do not already have undesired or unrelated changes by running `git status` or by checking the source control tab in Visual Studio Code.

```
$ git checkout main
$ git checkout -b exercise-games_wordle
$ git add .
$ git commit -m "finish games wordle exercise"
$ git push origin exercise-games_wordle
```

Create a pull request to your forked `main` branch. Please do not create a pull request to the DockYard Academy repository as this will spam our PR tracker.

**DockYard Academy Students Only:**

Notify your teacher by including `@BrooklinJazz` in your PR description to get feedback.

If you are interested in joining the next academy cohort, [sign up here](https://academy.dockyard.com/) to receive more news when it is available.

## Up Next

| Previous                                             | Next                                   |
| ---------------------------------------------------- | -------------------------------------: |
| [ExUnit With Mix](../reading/exunit_with_mix.livemd) | [Doctests](../reading/doctests.livemd) |
