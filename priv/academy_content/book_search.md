%{
  title: "Book Search"
}
---
# Book Search

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

## Book Search

You are building an application for searching books.

Represent each book as a `Book` struct with `title` and `content` keys. Then create a `Book.search/2` function to filter a list of Book structs as documented in the `Book` module below.

```elixir
defmodule Book do
  @moduledoc """
  Documentation for `Book`.

  ## Examples

    iex> %Book{title: "My Book Title"}
    %Book{title: "My Book Title"}
  """

  @doc """
  Search a list of Book structs. Search should match any book that includes the
  filter in their title.

  ## Examples

  Include books that exactly match the search query.

    iex> book1 = %Book{title: "A"}
    iex> book2 = %Book{title: "B"}
    iex> book3 = %Book{title: "C"}
    iex> Book.search([book1, book2, book3], "A")
    [%Book{title: "A"}]

  Include books that partially match the search query.

    iex> Book.search([%Book{title: "ABC"}], "A")
    [%Book{title: "ABC"}]

    iex> Book.search([%Book{title: "BAC"}], "A")
    [%Book{title: "BAC"}]

  Search should be case insensitive.

    iex> Book.search([%Book{title: "ABC"}], "a")
    [%Book{title: "ABC"}]
  """
  def search(books, query) do
  end
end
```

## Commit Your Progress

Run the following in your command line from the curriculum folder to track and save your progress in a Git commit.
Ensure that you do not already have undesired or unrelated changes by running `git status` or by checking the source control tab in Visual Studio Code.

```
$ git checkout main
$ git checkout -b exercise-book_search
$ git add .
$ git commit -m "finish book search exercise"
$ git push origin exercise-book_search
```

Create a pull request to your forked `main` branch. Please do not create a pull request to the DockYard Academy repository as this will spam our PR tracker.

**DockYard Academy Students Only:**

Notify your teacher by including `@BrooklinJazz` in your PR description to get feedback.

If you are interested in joining the next academy cohort, [sign up here](https://academy.dockyard.com/) to receive more news when it is available.

## Up Next

| Previous                                                 | Next                                                               |
| -------------------------------------------------------- | -----------------------------------------------------------------: |
| [Animal Generator](../exercises/animal_generator.livemd) | [Filter Values By Type](../exercises/filter_values_by_type.livemd) |
