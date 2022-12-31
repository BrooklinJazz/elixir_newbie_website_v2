%{
  title: "Caesar Cypher"
}
---
# Caesar Cypher

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

## Caesar Cypher

You're going to create a Caesar Cypher. A cypher alters characters in order to make secret messages. The Caesar cypher is a substitution cypher named after the Roman emperor Julius Caesar.

A Caesar cypher shifts characters by some key. For example, if the key is `1` then each character shifts over by one, so `"a"` becomes `"b"`, `"b"` becomes `"c"` and so on.

Create a `CaesarCypher.encode/1` function which shifts each letter in a string by a key. The default key should be `1`.

<!-- livebook:{"force_markdown":true} -->

```elixir
CaesarCypher.encode("abcdefghijklmnopqrstuvwyxz")
"bcdefghijklmnopqrstuvwyxza"
```

You only need to handle **lowercase letters**.

### Bonus: Any Key

Create a `CaesarCypher.encode/2` function which encodes the string by a provided key. For example, if the key is `2` then each letter shifts over by two, so `"a"` becomes `"c"`, `"b"` becomes `"d"` and so on.

<!-- livebook:{"force_markdown":true} -->

```elixir
CaesarCypher.encode("abcdefghijklmnopqrstuvwyxz", 2)
"cdefghijklmnopqrstuvwyxzab"
```

<details style="background-color: lightgreen; padding: 1rem; margin: 1rem 0;">
<summary>Example Solution</summary>

```elixir
defmodule CaesarCypher do
 def encode(string) do
    String.to_charlist(string)
    |> Enum.map(fn
      ?z -> ?a
      char -> char + 1
    end)
    |> List.to_string()
  end

  def encode(string, key) do
    String.to_charlist(string)
    |> Enum.map(fn char ->
      overflow = char + key > ?z
      if overflow do
        ?a + rem(char + key, ?z) - 1
      else
        char + key
      end
    end)
    |> List.to_string()
  end
end
```

</details>

Implement the `CaesarCypher` module as documented.

```elixir
defmodule CaesarCypher do
  @moduledoc """
  Documentation for `CaesarCypher`
  """

  @doc """
  Encode a string using the caesar cypher.
  Shift every letter over by one.

  ## Examples

    iex> CaesarCypher.encode("abcdefghijklmnopqrstuvwyxz")
    "bcdefghijklmnopqrstuvwyxza"
  """
  @spec encode(String.t()) :: String.t()
  def encode(string) do
    2
  end

  @doc """
  Encode a string using the caesar cypher and a provided key.
  Shift every letter over by the provided key.

  ## Examples

    iex> CaesarCypher.encode("abcdefghijklmnopqrstuvwyxz", 1)
    "bcdefghijklmnopqrstuvwyxza"

    iex> CaesarCypher.encode("abcdefghijklmnopqrstuvwyxz", 2)
    "cdefghijklmnopqrstuvwyxzab"

    iex> CaesarCypher.encode("abcdefghijklmnopqrstuvwyxz", 14)
    "opqrstuvwxyzabcdefghijklmn"
  """
  def encode(string, key) do
  end
end
```

## Commit Your Progress

Run the following in your command line from the curriculum folder to track and save your progress in a Git commit.
Ensure that you do not already have undesired or unrelated changes by running `git status` or by checking the source control tab in Visual Studio Code.

```
$ git checkout main
$ git checkout -b exercise-caesar_cypher
$ git add .
$ git commit -m "finish caesar cypher exercise"
$ git push origin exercise-caesar_cypher
```

Create a pull request to your forked `main` branch. Please do not create a pull request to the DockYard Academy repository as this will spam our PR tracker.

**DockYard Academy Students Only:**

Notify your teacher by including `@BrooklinJazz` in your PR description to get feedback.

If you are interested in joining the next academy cohort, [sign up here](https://academy.dockyard.com/) to receive more news when it is available.

## Up Next

| Previous                                                 | Next                                                             |
| -------------------------------------------------------- | ---------------------------------------------------------------: |
| [Email Validation](../exercises/email_validation.livemd) | [Rollable Expressions](../exercises/rollable_expressions.livemd) |

