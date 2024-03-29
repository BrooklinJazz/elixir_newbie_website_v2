%{
  title: "Score Tracker"
}
---
# Score Tracker

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
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="https://github.com/DockYard-Academy/curriculum/issues/new?assignees=&labels=&template=issue.md&title=Score Tracker">Report An Issue</a>
</div>
<div style="display: flex;">
<i class="ri-arrow-left-fill"></i>
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="../exercises/mailbox_server.livemd">Mailbox Server</a>
</div>
<div style="display: flex;">
<a style="display: flex; color: #61758a; margin-right: 1rem;" href="../exercises/timer.livemd">Timer</a>
<i class="ri-arrow-right-fill"></i>
</div>
</div>

## Score Tracker

You're going to create a `ScoreTracker` [GenServer](https://hexdocs.pm/elixir/GenServer.html) which will be a generic score tracker that could be used in any game system. When spawned, the `ScoreTracker` should store a score starting at `0` in it's state.

The `ScoreTracker` module should **asynchronously** receive `{:score, amount}` messages where `amount` is an integer which
increase the `ScoreTracker`'s state by the provided `amount`.

The `ScoreTracker` module should **synchronously** receive `:get_score` messages to return the current score.

<!-- livebook:{"force_markdown":true} -->

```elixir
{:ok, pid} = ScoreTracker.start_link([])
ScoreTracker.score(pid, 10)
10 = ScoreTracker.get_score(pid)
ScoreTracker.score(pid, 20)
30 = ScoreTracker.get_score(pid)
```

<details style="background-color: lightgreen; padding: 1rem; margin: 1rem 0;">
<summary>Example Solution</summary>

```elixir
defmodule ScoreTracker do
  use GenServer

  def start_link(_opts) do
    GenServer.start_link(__MODULE__, [])
  end

  def score(score_tracker_pid, amount) do
    GenServer.cast(score_tracker_pid, {:score, amount})
  end

  def get_score(score_tracker_pid) do
    GenServer.call(score_tracker_pid, :get_score)
  end

  @impl true
  def init(_opts) do
    {:ok, 0}
  end

  @impl true
  def handle_cast({:score, amount}, state) do
    {:noreply, state + amount}
  end

  @impl true
  def handle_call(:get_score, _from, state) do
    {:reply, state, state}
  end
end
```

</details>

Implement the `ScoreTracker` module as documented below. You will also have to implement the necessary [GenServer](https://hexdocs.pm/elixir/GenServer.html) callback functions such as [GenServer.init/1](https://hexdocs.pm/elixir/GenServer.html#init/1), [GenServer.handle_cast/2](https://hexdocs.pm/elixir/GenServer.html#handle_cast/2), and [GenServer.handle_call/3](https://hexdocs.pm/elixir/GenServer.html#handle_call/3).

```elixir
defmodule ScoreTracker do
  @moduledoc """
  Documentation for `ScoreTracker`
  """
  use GenServer

  @doc """
  Start the `ScoreTracker` process.

  ## Examples

    iex> {:ok, pid} = ScoreTracker.start_link([])
  """
  def start_link(_opts) do
  end

  @doc """
  Asynchronously increase the stored score by the specified amount.

  ## Examples

      iex> {:ok, pid} = ScoreTracker.start_link([])
      iex> ScoreTracker.score(pid, 10)
      :ok
  """
  def score(score_tracker_pid, amount) do
  end

  @doc """
  Synchronously return the current score state.

  ## Examples

      iex> {:ok, pid} = ScoreTracker.start_link([])
      iex> ScoreTracker.get_score(pid)
      0
  """
  def get_score(score_tracker_pid) do
  end
end
```

## Bonus: Multiplayer Score Tracker

Create a `MultiplayerScoreTracker` which can track scores for multiple named players.

<details style="background-color: lightgreen; padding: 1rem; margin: 1rem 0;">
<summary>Example Solution</summary>

```elixir
defmodule MultiplayerScoreTracker do
  use GenServer

  def start_link(_opts) do
    GenServer.start_link(__MODULE__, [])
  end

  def score(multiplayer_score_tracker_pid, player_name, amount) do
    GenServer.cast(multiplayer_score_tracker_pid, {:score, player_name, amount})
  end

  def all_scores(multiplayer_score_tracker_pid) do
    GenServer.call(multiplayer_score_tracker_pid, :all_scores)
  end

  def get_score(multiplayer_score_tracker_pid, player_name) do
    GenServer.call(multiplayer_score_tracker_pid, {:get_score, player_name})
  end

  @impl true
  def init(_opts) do
    {:ok, %{}}
  end

  @impl true
  def handle_cast({:score, player_name, amount}, state) do
    {:noreply, Map.update(state, player_name, amount, fn current -> current + amount end)}
  end

  @impl true
  def handle_call(:all_scores, _from, state) do
    {:reply, state, state}
  end

  @impl true
  def handle_call({:get_score, player_name}, _from, state) do
    {:reply, state[player_name], state}
  end
end
```

</details>

Implement the `MultiplayerScoreTracker` as documented below. You will also have to implement the necessary [GenServer](https://hexdocs.pm/elixir/GenServer.html) callback functions such as [GenServer.init/1](https://hexdocs.pm/elixir/GenServer.html#init/1), [GenServer.handle_cast/2](https://hexdocs.pm/elixir/GenServer.html#handle_cast/2), and [GenServer.handle_call/3](https://hexdocs.pm/elixir/GenServer.html#handle_call/3).

```elixir
defmodule MultiplayerScoreTracker do
  @moduledoc """
  Documentation for `MultiplayerScoreTracker`
  """
  use GenServer

  @doc """
  Start the `MultiplayerScoreTracker` process.

  ## Examples

      iex> {:ok, _pid} = MultiplayerScoreTracker.start_link([])
  """
  def start_link(_opts) do
  end

  @doc """
  Asynchronously add to the score of a named player. Creates the player if they do not already exist.

  ## Examples

      iex> {:ok, pid} = MultiplayerScoreTracker.start_link([])
      iex> MultiplayerScoreTracker.score(pid, :player1, 10)
      :ok
      iex> MultiplayerScoreTracker.score(pid, :player2, 10)
      :ok
      iex> MultiplayerScoreTracker.score(pid, :abc, 10)
      :ok
  """
  def score(multiplayer_score_tracker_pid, player_name, amount) do
  end

  @doc """
  Synchronously retrieve all of the player scores in a map.

  ## Examples

      Empty Scores.

      iex> {:ok, pid} = MultiplayerScoreTracker.start_link([])
      iex> MultiplayerScoreTracker.all_scores(pid)
      %{}

      Single Player Score.

      iex> {:ok, pid} = MultiplayerScoreTracker.start_link([])
      iex> MultiplayerScoreTracker.score(pid, :player1, 10)
      iex> MultiplayerScoreTracker.score(pid, :player1, 10)
      iex> MultiplayerScoreTracker.all_scores(pid)
      %{player1: 20}

      Multiple Player Scores.

      iex> {:ok, pid} = MultiplayerScoreTracker.start_link([])
      iex> MultiplayerScoreTracker.score(pid, :player1, 10)
      iex> MultiplayerScoreTracker.score(pid, :player2, 10)
      iex> MultiplayerScoreTracker.all_scores(pid)
      %{player1: 10, player2: 10}
  """
  def all_scores(multiplayer_score_tracker_pid) do
  end

  @doc """
  Synchronously retrieve a single player's score. Return `nil` if the player does not exist.

  ## Examples

    Player does not exist.

    iex> {:ok, pid} = MultiplayerScoreTracker.start_link([])
    iex> MultiplayerScoreTracker.get_score(pid, :player1)
    nil

    Player exists.

    iex> {:ok, pid} = MultiplayerScoreTracker.start_link([])
    iex> MultiplayerScoreTracker.score(pid, :abc, 10)
    iex> MultiplayerScoreTracker.get_score(pid, :abc)
    10
  """
  def get_score(multiplayer_score_tracker_pid, player_name) do
  end
end
```

## Commit Your Progress

DockYard Academy now recommends you use the latest [Release](https://github.com/DockYard-Academy/curriculum/releases) rather than forking or cloning our repository.

Run `git status` to ensure there are no undesirable changes.
Then run the following in your command line from the `curriculum` folder to commit your progress.

```
$ git add .
$ git commit -m "finish Score Tracker exercise"
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
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="https://github.com/DockYard-Academy/curriculum/issues/new?assignees=&labels=&template=issue.md&title=Score Tracker">Report An Issue</a>
</div>
<div style="display: flex;">
<i class="ri-arrow-left-fill"></i>
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="../exercises/mailbox_server.livemd">Mailbox Server</a>
</div>
<div style="display: flex;">
<a style="display: flex; color: #61758a; margin-right: 1rem;" href="../exercises/timer.livemd">Timer</a>
<i class="ri-arrow-right-fill"></i>
</div>
</div>

