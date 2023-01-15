%{
  title: "Named Number Lists"
}
---
# Named Number Lists

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

## Named Number Lists

Generate a list with ten random integers from `0` to `9`. Convert each integer in this list to it's string representation so `1` would become `"one"`.

<!-- livebook:{"force_markdown":true} -->

```elixir
# input
[1, 2, 4, 2, 7, 8, 0, 4, 5, 6]
# output
["one", "two", "four", "two", "seven", "eight", "zero", "four", "five", "six"]
```

<!-- livebook:{"break_markdown":true} -->

```mermaid
flowchart
   0 --> zero
   1 --> one
   2 --> two
   3 --> three
   4 --> four
   5 --> five
   6 --> six
   7 --> seven
   8 --> eight
   9 --> nine
```

<!-- livebook:{"break_markdown":true} -->

<details style="background-color: lightgreen; padding: 1rem; margin: 1rem 0;">
  <summary>Example Solution</summary>

  ```elixir
  random_integers = Enum.map(1..10, fn _ -> Enum.random(0..9) end)

  Enum.map(random_integers, fn integer ->
    case integer do
      0 -> "zero"
      1 -> "one"
      2 -> "two"
      3 -> "three"
      4 -> "four"
      5 -> "five"
      6 -> "six"
      7 -> "seven"
      8 -> "eight"
      9 -> "nine"
    end
  end)
  ```
</details>

Enter your solution below.

```elixir

```

## Commit Your Progress

Run the following in your command line from the curriculum folder to track and save your progress in a Git commit.
Ensure that you do not already have undesired or unrelated changes by running `git status` or by checking the source control tab in Visual Studio Code.

```
$ git checkout main
$ git checkout -b exercise-named_number_lists
$ git add .
$ git commit -m "finish named number lists exercise"
$ git push origin exercise-named_number_lists
```

Create a pull request to your forked `main` branch. Please do not create a pull request to the DockYard Academy repository as this will spam our PR tracker.

**DockYard Academy Students Only:**

Notify your teacher by including `@BrooklinJazz` in your PR description to get feedback.

If you are interested in joining the next academy cohort, [sign up here](https://academy.dockyard.com/) to receive more news when it is available.

## Up Next

| Previous                                 | Next                                                 |
| ---------------------------------------- | ---------------------------------------------------: |
| [FizzBuzz](../exercises/fizzbuzz.livemd) | [Counting Votes](../exercises/counting_votes.livemd) |
