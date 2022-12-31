%{
  title: "Concurrent Word Count"
}
---
# Concurrent Word Count

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

## Concurrent Word Count

Given a list of documents, use the [Task](https://hexdocs.pm/elixir/Task.html) module to concurrently find the total word count of every document combined.

For our purposes, a **word** will be any sequence of characters separated by a space. You do not have to handle invalid words, punctuation, or other special cases.

```elixir
document = """
This is my document document
"""

String.split(document, " ", trim: true)
```

<details style="background-color: lightgreen; padding: 1rem; margin: 1rem 0;">
<summary>Example Solution</summary>

```elixir
defmodule WordCount do
  def individual_count(documents) do
    tasks =
      Enum.map(documents, fn document ->
        Task.async(fn ->
          document |> String.split(" ", trim: true) |> Enum.count()
        end)
      end)

    Task.await_many(tasks)
  end

  def total_count(documents) do
    documents |> individual_count() |> Enum.sum()
  end
end
```

</details>

Implement the `WordCount` module as documented below.

```elixir
defmodule WordCount do
  @moduledoc """
  Documentation for `WordCount`.
  """

  @doc """
  Concurrently count the number of words in each document.

  ## Examples

      iex> WordCount.individual_count(["document one", "document two"])
      [2, 2]
  """
  def individual_count(documents) do
  end

  @doc """
  Concurrently count the number of words in each document and return
  the combined count.

  iex> WordCount.total_count(["document one", "document two"])
  4
  """
  def total_count(documents) do
  end
end
```

Run the following in your command line from the curriculum folder to track and save your progress in a Git commit.
Ensure that you do not already have undesired or unrelated changes by running `git status` or by checking the source control tab in Visual Studio Code.

```
$ git checkout main
$ git checkout -b exercise-concurrent_image_processing
$ git add .
$ git commit -m "finish concurrent image processing exercise"
$ git push origin exercise-concurrent_image_processing
```

Create a pull request to your forked `main` branch. Please do not create a pull request to the DockYard Academy repository as this will spam our PR tracker.

**DockYard Academy Students Only:**

Notify your teacher by including `@BrooklinJazz` in your PR description to get feedback.

If you are interested in joining the next academy cohort, [sign up here](https://academy.dockyard.com/) to receive more news when it is available.

## Up Next

| Previous                                       | Next                                               |
| ---------------------------------------------- | -------------------------------------------------: |
| [Task Drills](../exercises/task_drills.livemd) | [Agents And ETS](../reading/agents_and_ets.livemd) |

