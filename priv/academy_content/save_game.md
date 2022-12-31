%{
  title: "Save Game"
}
---
# Save Game

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

## Save Game

Many games have a Save function, which allows players to save the current state of the game.
In some cases, the saved game is stored in a save file.

You're going to implement a `Game` module which simulates saving a video game's state using the file system. You should be able to store some arbitrary Elixir term in a given file, and retrieve it.

<details style="background-color: lightgreen; padding: 1rem; margin: 1rem 0;">
<summary>Example Solution</summary>

```elixir
defmodule Game do
  def save(game_state, filename) do
    File.write!(filename, :erlang.term_to_binary(game_state))
  end

  def load(filename) do
    File.read!(filename) |> :erlang.binary_to_term()
  end
end
```

</details>

Implement the `Game` module as documented below.

```elixir
defmodule Game do
  @moduledoc """
  Documentation for `Game`

  ## Examples

      iex> game_state = %{name: "Peter Parker", level: 10, location: "New York"}
      iex> Game.save(game_state, "save_file1")
      :ok
      iex> Game.load("save_file1")
      %{name: "Peter Parker", level: 10, location: "New York"}
  """

  @doc """
  Save an elixir term into a given file name.
  """
  def save(data, filename) do
  end

  @doc """
  Retrieve an elixir term from a given file name.
  """
  def load(filename) do
  end
end
```

## Commit Your Progress

Run the following in your command line from the curriculum folder to track and save your progress in a Git commit.
Ensure that you do not already have undesired or unrelated changes by running `git status` or by checking the source control tab in Visual Studio Code.

```
$ git checkout main
$ git checkout -b exercise-save_game
$ git add .
$ git commit -m "finish save game exercise"
$ git push origin exercise-save_game
```

Create a pull request to your forked `main` branch. Please do not create a pull request to the DockYard Academy repository as this will spam our PR tracker.

**DockYard Academy Students Only:**

Notify your teacher by including `@BrooklinJazz` in your PR description to get feedback.

If you are interested in joining the next academy cohort, [sign up here](https://academy.dockyard.com/) to receive more news when it is available.

## Up Next

| Previous                                       | Next                                                             |
| ---------------------------------------------- | ---------------------------------------------------------------: |
| [File Drills](../exercises/file_drills.livemd) | [File System Todo App](../exercises/file_system_todo_app.livemd) |

