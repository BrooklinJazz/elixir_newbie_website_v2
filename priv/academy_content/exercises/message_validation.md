%{
  title: "Message Validation"
}
---
# Message Validation

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
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="https://github.com/DockYard-Academy/curriculum/issues/new?assignees=&labels=&template=issue.md&title=Message Validation">Report An Issue</a>
</div>
<div style="display: flex;">
<i class="ri-arrow-left-fill"></i>
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="../reading/with.livemd">With</a>
</div>
<div style="display: flex;">
<a style="display: flex; color: #61758a; margin-right: 1rem;" href="../exercises/with_points.livemd">With Points</a>
<i class="ri-arrow-right-fill"></i>
</div>
</div>

## Message Validation

You're creating a messaging application where users can send each other messages as a string.

<!-- livebook:{"force_markdown":true} -->

```elixir
Message.send("hello!")
"hello!"
```

Use guards to ensure `Message.send/1` does not allow invalid data types.

<!-- livebook:{"force_markdown":true} -->

```elixir
Message.send(123)
** (FunctionClauseError) no function clause matching in Message.send/1    
    
    The following arguments were given to Message.send/1:
    
        # 1
        123
```

Users can also send each other messages as a `Message` struct which has a `:body` key.
Make sure you define a message struct, and use guards to create a `Message.send/1` clause which can handle `Message` structs. `Message.send/1` should return the `:body` field of the message.

<!-- livebook:{"force_markdown":true} -->

```elixir
Message.send(%Message{body: "hello!"})

```

Only allow messages that have a string in their `:body` field.

<!-- livebook:{"force_markdown":true} -->

```elixir
Message.send(%Message{body: 123})
** (FunctionClauseError) no function clause matching in Message.send/1    
    
    The following arguments were given to Message.send/1:
    
        # 1
        %Message{body: 123}
```

<details style="background-color: lightgreen; padding: 1rem; margin: 1rem 0;">
<summary>Example Solution</summary>

```elixir
defmodule Message do
  defstruct [:body]
  def send(message) when is_binary(message) do
    message
  end

  def send(message) when is_binary(message.body) do
    message.body
  end
end
```

</details>

Implement the `Message` module as documented below.

```elixir
defmodule Message do
  @moduledoc """
  Documentation for `Message`

    ## Examples

      iex> %Message{}
      %Message{body: nil}
  """
  defstruct []

  @doc """
  Send messages between users.
  Returns a string of the message if provided valid input.

  ## Examples

    iex> Message.send("hello!")
    "hello!"

    iex> Message.send("hi!")
    "hi!"

    iex> Message.send(%Message{body: "hello!"})
    "hello!"

    iex> Message.send(%Message{body: "hi!"})
    "hi!"

    iex> Message.send(123)
    ** (FunctionClauseError) no function clause matching in Message.send/1

    iex> Message.send(%{})
    ** (FunctionClauseError) no function clause matching in Message.send/1

    iex> Message.send({})
    ** (FunctionClauseError) no function clause matching in Message.send/1

    iex> Message.send(%Message{body: nil})
    ** (FunctionClauseError) no function clause matching in Message.send/1
        
    iex> Message.send(%Message{body: {}})
    ** (FunctionClauseError) no function clause matching in Message.send/1
  """
  def send(message) do
  end
end
```

## Commit Your Progress

DockYard Academy now recommends you use the latest [Release](https://github.com/DockYard-Academy/curriculum/releases) rather than forking or cloning our repository.

Run `git status` to ensure there are no undesirable changes.
Then run the following in your command line from the `curriculum` folder to commit your progress.

```
$ git add .
$ git commit -m "finish Message Validation exercise"
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
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="https://github.com/DockYard-Academy/curriculum/issues/new?assignees=&labels=&template=issue.md&title=Message Validation">Report An Issue</a>
</div>
<div style="display: flex;">
<i class="ri-arrow-left-fill"></i>
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="../reading/with.livemd">With</a>
</div>
<div style="display: flex;">
<a style="display: flex; color: #61758a; margin-right: 1rem;" href="../exercises/with_points.livemd">With Points</a>
<i class="ri-arrow-right-fill"></i>
</div>
</div>

