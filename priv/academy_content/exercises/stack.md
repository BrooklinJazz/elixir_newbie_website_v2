%{
  title: "Stack GenServer Testing"
}
---
# Tested Stack

```elixir
Mix.install([
  {:jason, "~> 1.4"},
  {:kino, "~> 0.9", override: true},
  {:youtube, github: "brooklinjazz/youtube"},
  {:hidden_cell, github: "brooklinjazz/hidden_cell"}
])
```

## Navigation

<div style="display: flex; align-items: center; width: 100%; justify-content: space-between; font-size: 1rem; color: #61758a; background-color: #f0f5f9; height: 4rem; padding: 0 1rem; border-radius: 1rem;">
<div style="display: flex;">
<i class="ri-home-fill"></i>
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="../start.livemd">Home</a>
</div>
<div style="display: flex;">
<i class="ri-bug-fill"></i>
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="https://github.com/DockYard-Academy/curriculum/issues/new?assignees=&labels=&template=issue.md&title=Tested Stack">Report An Issue</a>
</div>
<div style="display: flex;">
<i class="ri-arrow-left-fill"></i>
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="../exercises/stack_server.livemd">Stack Server</a>
</div>
<div style="display: flex;">
<a style="display: flex; color: #61758a; margin-right: 1rem;" href="../exercises/traffic_light_server.livemd">Traffic Light Server</a>
<i class="ri-arrow-right-fill"></i>
</div>
</div>

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
# Return No Value When The Stack Is Empty
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

DockYard Academy now recommends you use the latest [Release](https://github.com/DockYard-Academy/curriculum/releases) rather than forking or cloning our repository.

Run `git status` to ensure there are no undesirable changes.
Then run the following in your command line from the `curriculum` folder to commit your progress.

```
$ git add .
$ git commit -m "finish Tested Stack exercise"
$ git push
```

We're proud to offer our open-source curriculum free of charge for anyone to learn from at their own pace.

We also offer a paid course where you can learn from an instructor alongside a cohort of your peers.
We will accept applications for the June-August 2023 cohort soon.

## Navigation

<div style="display: flex; align-items: center; width: 100%; justify-content: space-between; font-size: 1rem; color: #61758a; background-color: #f0f5f9; height: 4rem; padding: 0 1rem; border-radius: 1rem;">
<div style="display: flex;">
<i class="ri-home-fill"></i>
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="../start.livemd">Home</a>
</div>
<div style="display: flex;">
<i class="ri-bug-fill"></i>
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="https://github.com/DockYard-Academy/curriculum/issues/new?assignees=&labels=&template=issue.md&title=Tested Stack">Report An Issue</a>
</div>
<div style="display: flex;">
<i class="ri-arrow-left-fill"></i>
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="../exercises/stack_server.livemd">Stack Server</a>
</div>
<div style="display: flex;">
<a style="display: flex; color: #61758a; margin-right: 1rem;" href="../exercises/traffic_light_server.livemd">Traffic Light Server</a>
<i class="ri-arrow-right-fill"></i>
</div>
</div>

