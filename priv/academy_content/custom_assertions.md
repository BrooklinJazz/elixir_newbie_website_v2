%{
  title: "Custom Assertions"
}
---
# Custom Assertions

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

## Custom Assertions

Create a `CustomAssertion.assert` macro which provides test feedback in the format:

<!-- livebook:{"force_markdown":true} -->

```elixir
"""
Assertion with `==` failed.

left: 1
right: 2
"""
```

Your solution should work with the `==`, `>`, `<`, `<=`, `>=`, and `===` operators.

Print a `"Success"` message if the assertion passes.

<details style="background-color: lightgreen; padding: 1rem; margin: 1rem 0;">
<summary>Example Solution</summary>

If we want to have full control over the result, one solution would be to use multiple function heads (or any means of control flow) for each operator. However, if we don't have custom messages for each operator, we can cleverly use the `apply/3` function to keep our solution minimal.

```elixir
defmodule CustomAssertion do
  @success "Success!"

  def check(operator, left, right) do
    if apply(Kernel, operator, [left, right]) do
      @success
    else
      """
      Assertion with #{operator} failed.
      left: #{left}
      right: #{right}
      """
    end
  end

  defmacro assert({operator, _meta, [left, right]}) do
    quote do
      CustomAssertion.check(unquote(operator), unquote(left), unquote(right))
    end
  end
end
```

</details>

```elixir
defmodule CustomAssertion do
  defmacro assert({operator, _meta, [left, right]}) do
  end
end
```

Your solution should be able to display failure messages for the following assertions.

```elixir
require CustomAssertion

CustomAssertion.assert(1 == 2) |> IO.puts()
CustomAssertion.assert(1 === 2) |> IO.puts()
CustomAssertion.assert(1 > 2) |> IO.puts()
CustomAssertion.assert(1 >= 2) |> IO.puts()
CustomAssertion.assert(2 < 1) |> IO.puts()
CustomAssertion.assert(2 <= 1) |> IO.puts()
```

Your solution should display success messages for the following assertions.

```elixir
require CustomAssertion

CustomAssertion.assert(1 == 1) |> IO.puts()
CustomAssertion.assert(1 === 1) |> IO.puts()
CustomAssertion.assert(2 > 1) |> IO.puts()
CustomAssertion.assert(1 >= 1) |> IO.puts()
CustomAssertion.assert(1 < 2) |> IO.puts()
CustomAssertion.assert(1 <= 1) |> IO.puts()
```

## Commit Your Progress

Run the following in your command line from the curriculum folder to track and save your progress in a Git commit.
Ensure that you do not already have undesired or unrelated changes by running `git status` or by checking the source control tab in Visual Studio Code.

```
$ git checkout main
$ git checkout -b exercise-custom_assertions
$ git add .
$ git commit -m "finish custom assertions exercise"
$ git push origin exercise-custom_assertions
```

Create a pull request to your forked `main` branch. Please do not create a pull request to the DockYard Academy repository as this will spam our PR tracker.

**DockYard Academy Students Only:**

Notify your teacher by including `@BrooklinJazz` in your PR description to get feedback.

If you are interested in joining the next academy cohort, [sign up here](https://academy.dockyard.com/) to receive more news when it is available.

## Up Next

| Previous                                     | Next                                                               |
| -------------------------------------------- | -----------------------------------------------------------------: |
| [Macro Math](../exercises/macro_math.livemd) | [Supervised Mix Project](../reading/supervised_mix_project.livemd) |

