%{
  title: "Stack GenServer Testing"
}
---
# Tested Stack

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

## Tested Stack

Previously you created a [Stack](./stack_server.livemd) [GenServer](https://hexdocs.pm/elixir/GenServer.html). Now you're going to re-create the `Stack` [GenServer](https://hexdocs.pm/elixir/GenServer.html) with a full test suite.

The `Stack` process should store a list as state and `push/2` elements onto the stack, and `pop/2` elements off of the stack like so.

<!-- livebook:{"force_markdown":true} -->

```elixir
{:ok, pid} = Stack.start_link([])
[:one] = Stack.push(pid, :one)
[:two, :one] = Stack.push(pid, :two)
:two = Stack.pop(pid)
:one = Stack.pop(pid)
# return no value when the stack is empty
nil = Stack.pop(pid)
```

<!-- livebook:{"break_markdown":true} -->

### Pair Testing

This will be a **pair testing** exercise. One student will be the **tester** and the other will be the **implementer**. The **tester** will write the test, and the **implementer** will implement the code for the test.

As the **implementer** you may challenge your **tester** to improve their tests by writing only the code necessary to make the test pass (within reason) even if it is a false-positive. This will encourage your **tester** to write more comprehensive tests.

Swap roles for each new test.

<!-- livebook:{"break_markdown":true} -->

### Create A Mix Project

Create a new mix project and use LiveShare to make it simpler to collaborate with your pair partner.

```
mix new stack
```

Copy the code below into your `Stack` module.

```elixir
defmodule Stack do
  use GenServer

  def start_link(_opts) do
  end

  def push(pid, element) do
  end

  def pop(pid) do
  end
end
```

Then copy the following code into the associated test file for the `Stack` module.

```elixir
defmodule StackTest do
  use ExUnit.Case

  describe "start_link/1" do
    test "with no configuration"
    test "with a default state"
  end

  describe "push/2" do
    test "an element onto an empty stack"
    test "an element onto a stack with one element"
    test "an element onto a stack with multiple elements"
  end

  describe "pop/1" do
    test "an empty stack"
    test "a stack with one element"
    test "a stack with multiple elements"
  end
end
```

## Bonus: GitHub Repository

Upload your stack project to GitHub. You may add your partner as a collaborator, or they can fork the project so that you both own a copy.

Create a README that describes the purpose of the project and what you learned.

## Commit Your Progress

Run the following in your command line from the curriculum folder to track and save your progress in a Git commit.
Ensure that you do not already have undesired or unrelated changes by running `git status` or by checking the source control tab in Visual Studio Code.

```
$ git checkout main
$ git checkout -b exercise-stack
$ git add .
$ git commit -m "finish stack exercise"
$ git push origin exercise-stack
```

Create a pull request to your forked `main` branch. Please do not create a pull request to the DockYard Academy repository as this will spam our PR tracker.

**DockYard Academy Students Only:**

Notify your teacher by including `@BrooklinJazz` in your PR description to get feedback.

If you are interested in joining the next academy cohort, [sign up here](https://academy.dockyard.com/) to receive more news when it is available.

## Up Next

| Previous                                                   | Next                                                           |
| ---------------------------------------------------------- | -------------------------------------------------------------: |
| [Testing GenServers](../reading/testing_genservers.livemd) | [Games Score Tracker](../exercises/games_score_tracker.livemd) |

