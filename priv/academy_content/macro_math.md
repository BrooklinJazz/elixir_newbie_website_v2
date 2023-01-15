%{
  title: "Macro Math"
}
---
# Macro Math

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

## Macro Math

You're creating a math game. Players will be given math questions in the format `"2 + 2"`.

The string can contain multiple operations in any order such as `"2 + 10 * 23 - 10"`

You need to determine the correct result to check with the player's answer.

<!-- livebook:{"force_markdown":true} -->

```elixir
Math.correct?("2 + 2", 4) # true 
Math.correct?("2 + 2", 5) # false
```

<details style="background-color: lightgreen; padding: 1rem; margin: 1rem 0;">
<summary>Example Solution</summary>

```elixir
defmodule Math do
  def correct?(equation, player_answer) do
    {result, _bindings} = Code.eval_string(equation)
    result == player_answer
  end
end
```

</details>

Implement the `Math` module as documented.

```elixir
defmodule Math do
  @doc """
  Determine if a player's answer matches the result of the math expression in the string.

  iex> Math.correct?("1 + 1", 2)
  true
  iex> Math.correct?("1 + 1", 4)
  false
  iex> Math.correct?("1 - 1", 0)
  true
  iex> Math.correct?("10 + 14 * 4 - 2", 64)
  true
  """
  def correct?(equation, player_answer) do
  end
end
```

## Commit Your Progress

Run the following in your command line from the curriculum folder to track and save your progress in a Git commit.
Ensure that you do not already have undesired or unrelated changes by running `git status` or by checking the source control tab in Visual Studio Code.

```
$ git checkout main
$ git checkout -b exercise-macro_math
$ git add .
$ git commit -m "finish macro math exercise"
$ git push origin exercise-macro_math
```

Create a pull request to your forked `main` branch. Please do not create a pull request to the DockYard Academy repository as this will spam our PR tracker.

**DockYard Academy Students Only:**

Notify your teacher by including `@BrooklinJazz` in your PR description to get feedback.

If you are interested in joining the next academy cohort, [sign up here](https://academy.dockyard.com/) to receive more news when it is available.

## Up Next

| Previous                                             | Next                                                       |
| ---------------------------------------------------- | ---------------------------------------------------------: |
| [Metaprogramming](../reading/metaprogramming.livemd) | [Custom Assertions](../exercises/custom_assertions.livemd) |

