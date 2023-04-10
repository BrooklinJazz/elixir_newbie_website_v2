%{
  title: "Process Mailbox"
}
---
# Process Mailbox

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
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="https://github.com/DockYard-Academy/curriculum/issues/new?assignees=&labels=&template=issue.md&title=Process Mailbox">Report An Issue</a>
</div>
<div style="display: flex;">
<i class="ri-arrow-left-fill"></i>
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="../exercises/process_drills.livemd">Process Drills</a>
</div>
<div style="display: flex;">
<a style="display: flex; color: #61758a; margin-right: 1rem;" href="../reading/generic_server.livemd">Generic Server</a>
<i class="ri-arrow-right-fill"></i>
</div>
</div>

## Process Mailbox

You're going to create a `Mailbox` using a process which loops and receives messages.

<!-- livebook:{"force_markdown":true} -->

```elixir
mailbox_process = spawn(fn -> Mailbox.loop() end)
```

You should be able to send the `Mailbox` a message to add a virtual letter to the mailbox.
Print the current list of letters during every loop to prove your spawned process is storing every message in its state.

<!-- livebook:{"force_markdown":true} -->

```elixir
send(mailbox_process, {:mail, "You've Got Mail!"})
# ["You've Got Mail!"]

send(mailbox_process, {:mail, "You've Got Mail..Again!"})
# ["You've Got Mail..Again!", "You've Got Mail!"]
```

We won't typically work directly with processes like this. Instead we'll rely on abstractions such as [GenServer](https://hexdocs.pm/elixir/GenServer.html) which we will learn about in a future lesson.

<details style="background-color: lightgreen; padding: 1rem; margin: 1rem 0;">
<summary>Example Solution</summary>

```elixir
defmodule Mailbox do
  def loop(state \\ []) do
    IO.inspect(state)
    receive do
      {:mail, letter} -> loop([letter | state])
    end
  end
end
```

</details>

Implement the `Mailbox` module below.

```elixir
defmodule Mailbox do
  @moduledoc """
  Documentation for `Mailbox`
  """

  @doc """
  Recursively loop and receive messages.

  ## Examples

      iex> counter_process = spawn(fn -> Mailbox.loop() end)
      iex> send(counter_process, {:mail, "Hello!"})
  """
  def loop(state \\ []) do
  end
end
```

## Commit Your Progress

DockYard Academy now recommends you use the latest [Release](https://github.com/DockYard-Academy/curriculum/releases) rather than forking or cloning our repository.

Run `git status` to ensure there are no undesirable changes.
Then run the following in your command line from the `curriculum` folder to commit your progress.

```
$ git add .
$ git commit -m "finish Process Mailbox exercise"
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
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="https://github.com/DockYard-Academy/curriculum/issues/new?assignees=&labels=&template=issue.md&title=Process Mailbox">Report An Issue</a>
</div>
<div style="display: flex;">
<i class="ri-arrow-left-fill"></i>
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="../exercises/process_drills.livemd">Process Drills</a>
</div>
<div style="display: flex;">
<a style="display: flex; color: #61758a; margin-right: 1rem;" href="../reading/generic_server.livemd">Generic Server</a>
<i class="ri-arrow-right-fill"></i>
</div>
</div>

