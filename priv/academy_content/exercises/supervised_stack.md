%{
  title: "Supervised Stack"
}
---
# Supervised Stack

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
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="https://github.com/DockYard-Academy/curriculum/issues/new?assignees=&labels=&template=issue.md&title=Supervised Stack">Report An Issue</a>
</div>
<div style="display: flex;">
<i class="ri-arrow-left-fill"></i>
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="../reading/supervisors.livemd">Supervisors</a>
</div>
<div style="display: flex;">
<a style="display: flex; color: #61758a; margin-right: 1rem;" href="../exercises/dominoes.livemd">Dominoes</a>
<i class="ri-arrow-right-fill"></i>
</div>
</div>

## Supervised Stack

Previously we created a [Stack](./stack_server.livemd) [GenServer](https://hexdocs.pm/elixir/GenServer.html) process.

We've made a slight modification to the `Stack` process by adding a `start_link/1` function so this named `Stack` can be started under a [Supervisor](https://hexdocs.pm/elixir/Supervisor.html).

```elixir
defmodule Stack do
  use GenServer

  def start_link(opts) do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  @impl true
  def init(state) do
    {:ok, state}
  end

  @impl true
  def handle_call(:pop, _from, state) do
    [head | tail] = state
    {:reply, head, tail}
  end

  @impl true
  def handle_call({:push, element}, _from, state) do
    new_state = [element | state]
    {:reply, new_state, new_state}
  end
end
```

We're able to push and pop elements off of the stack.

```elixir
{:ok, stack_pid} = GenServer.start_link(Stack, [])

GenServer.call(stack_pid, {:push, 1}) |> IO.inspect(label: "push")
GenServer.call(stack_pid, {:push, 2}) |> IO.inspect(label: "push")
GenServer.call(stack_pid, {:push, 3}) |> IO.inspect(label: "push")

GenServer.call(stack_pid, :pop) |> IO.inspect(label: "pop")
GenServer.call(stack_pid, :pop) |> IO.inspect(label: "pop")
GenServer.call(stack_pid, :pop) |> IO.inspect(label: "pop")

# The Final State Is Empty.
:sys.get_state(stack_pid)
```

However, there's a bug. If we try to `pop/1` an item off of an empty stack, the process
will crash due to a function clause error because the `handle_call/2` function expects a list with one or more elements.

Uncomment the following code to watch the `Stack` crash.

```elixir
# {:ok, Pid} = GenServer.start_link(Stack, [])
# GenServer.call(stack_pid, :pop)
```

Normally, we could handle this by using control flow. For example, we could make another `handle_call/3` function clause for when the stack is empty.

<!-- livebook:{"force_markdown":true} -->

```elixir
# Return `nil` When The Stack Is Empty.
@impl true
def handle_call(:pop, _from, []) do
  {:reply, nil, []}
end
```

Instead, you're going to start the Stack process under a supervisor so that it will be restarted when it crashes. In the Elixir cell below, start the `Stack` process under a supervisor so that it will restart with an empty stack when it crashes.

<details style="background-color: lightgreen; padding: 1rem; margin: 1rem 0;">
<summary>Example Solution</summary>

```elixir
children = [
  {Stack, []}
]

{:ok, supervisor_pid} = Supervisor.start_link(children, strategy: :one_for_one)
```

</details>

Keep in mind, if you have already started a supervisor with the `Stack` process, your livebook may crash. You can resolve this issue by simply re-running the cell below to start the supervisor again.

```elixir

```

You should be able to send a `:pop` message to the `Stack` process and the [Supervisor](https://hexdocs.pm/elixir/Supervisor.html) will restart the `Stack` process.

Uncomment and evaluate the code below to test your supervisor.

```elixir
# GenServer.call(Stack, :pop)
```

## Commit Your Progress

DockYard Academy now recommends you use the latest [Release](https://github.com/DockYard-Academy/curriculum/releases) rather than forking or cloning our repository.

Run `git status` to ensure there are no undesirable changes.
Then run the following in your command line from the `curriculum` folder to commit your progress.

```
$ git add .
$ git commit -m "finish Supervised Stack exercise"
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
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="https://github.com/DockYard-Academy/curriculum/issues/new?assignees=&labels=&template=issue.md&title=Supervised Stack">Report An Issue</a>
</div>
<div style="display: flex;">
<i class="ri-arrow-left-fill"></i>
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="../reading/supervisors.livemd">Supervisors</a>
</div>
<div style="display: flex;">
<a style="display: flex; color: #61758a; margin-right: 1rem;" href="../exercises/dominoes.livemd">Dominoes</a>
<i class="ri-arrow-right-fill"></i>
</div>
</div>

