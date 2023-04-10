%{
  title: "with"
}
---
# With

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
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="https://github.com/DockYard-Academy/curriculum/issues/new?assignees=&labels=&template=issue.md&title=With">Report An Issue</a>
</div>
<div style="display: flex;">
<i class="ri-arrow-left-fill"></i>
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="../reading/guards.livemd">Guards</a>
</div>
<div style="display: flex;">
<a style="display: flex; color: #61758a; margin-right: 1rem;" href="../exercises/message_validation.livemd">Message Validation</a>
<i class="ri-arrow-right-fill"></i>
</div>
</div>

## With

`with` is often used with pattern matching to create "happy path" code.
It's useful whenever you have a series of cases or values that rely on each other.

You can use `with` to check some preconditions before executing instructions.

```mermaid
flowchart LR
  with --> 1
  1 --> 2
  2 --> 3
  3 --> 4
  1[pre-condition]
  2[pre-condition]
  3[pre-condition]
  4[instruction]
```

If any of the preconditions fail, the with statement will stop and return the value
of the failed precondition.

```mermaid
flowchart LR
  1[pre-condition]
  2[pre-condition]
  3[pre-condition]
  4[instruction]
  with --> 1
  1 --> 2
  2 --> 3
  3 --> 4
  1 --> 5[failed pre-condition]
  2 --> 5
  3 --> 5
```

Alternatively, you can use `else` to handle the result of a failed precondition.

```mermaid
flowchart LR
  1[pre-condition]
  2[pre-condition]
  3[pre-condition]
  4[instruction]
  with --> 1
  1 --> 2
  2 --> 3
  3 --> 4
  1 --> 5[failed pre-condition]
  2 --> 5
  3 --> 5
  5 --> 6[else]
```

<!-- livebook:{"break_markdown":true} -->

Here's a minimal example with a single precondition. `is_admin` must be true to delete a user. We're using pseudo-code and simply returning the `"delete user"` string.

```elixir
is_admin = true

with true <- is_admin do
  "delete user"
end
```

The `with` statement checks `is_admin`. If `true`, it returns `"delete_user"`.
If any other value, it returns the value of variable `is_admin`.

```mermaid
flowchart LR
  with --> is_admin --> 3["delete user"]
  is_admin --> 4[is_admin]
```

<!-- livebook:{"break_markdown":true} -->

`with` uses pattern matching to check if the left side of the `<-` matches the right side.
The example above is probably better served using a simple `if` statement, so let's make it
more realistic and store `is_admin` in a boolean on a user map.

```elixir
user = %{is_admin: true}

with true <- user do
  "delete user"
end
```

Because `%{is_admin: true}` does not match `true`, the with statement returns `%{is_admin: true}`.
Let's correct that.

```elixir
user = %{is_admin: true}

with %{is_admin: true} <- user do
  "delete user"
end
```

Great! That's working. But this is still probably better handled by an `if` or `case` statement.

```elixir
user = %{is_admin: true}

if user.is_admin do
  "delete user"
end
```

`with` is ideal for checking a series of preconditions.

Let's change our example to sending an email. To send an email, we need to ensure:

* The sending user is an admin.
* The receiving user has an email.
* The email has a title and a body.

We also need the `name` of the sender and receiver and their emails.

Before `with` statements, we might solve this problem using nested `case` statements. This produces unclear code.

```elixir
sending_user = %{name: "Batman", email: "notbrucewayne@bat.net", is_admin: true}
receiving_user = %{name: "Robin", email: "boywonder@bat.net"}
email = %{title: "ROBIN!", body: "WE'RE OUT OF BAT SNACKS!"}

case sending_user do
  %{is_admin: true, name: sender_name, email: sender_email} ->
    case receiving_user do
      %{name: receiver_name, email: receiver_email} ->
        case email do
          %{title: title, body: body} ->
            "from #{sender_name}:#{sender_email} to #{receiver_name}:#{receiver_email} #{title}, #{body}"
        end
    end
end
```

`with` replaces the need for nested case statements.

Here's the same code using `with`. There's still some natural complexity, but `with` improved the code clarity.

```elixir
sending_user = %{name: "Batman", email: "notbrucewayne@bat.net", is_admin: true}
receiving_user = %{name: "Robin", email: "boywonder@bat.net"}
email = %{title: "ROBIN!", body: "WE'RE OUT OF BAT SNACKS!"}

with %{is_admin: true, name: sender_name, email: sender_email} <- sending_user,
     %{name: receiver_name, email: receiver_email} <- receiving_user,
     %{title: title, body: body} <- email do
  "from #{sender_name}:#{sender_email} to #{receiver_name}:#{receiver_email} #{title}, #{body}"
end
```

Right now, if a value doesn't match the precondition, it returns the value. For example,
if the sender is `nil`, we return `nil`.

```elixir
sending_user = nil
receiving_user = %{name: "Robin", email: "boywonder@bat.net"}
email = %{title: "ROBIN!", body: "WE'RE OUT OF BAT SNACKS!"}

with %{is_admin: true, name: sender_name, email: sender_email} <- sending_user,
     %{name: receiver_name, email: receiver_email} <- receiving_user,
     %{title: title, body: body} <- email do
  "from #{sender_name}:#{sender_email} to #{receiver_name}:#{receiver_email} #{title}, #{body}"
end
```

Sometimes we want to return the value. Other times we want to handle the error in an `else` block.

```elixir
sending_user = "batman"
receiving_user = %{name: "Robin", email: "boywonder@bat.net"}
email = %{title: "ROBIN!", body: "WE'RE OUT OF BAT SNACKS!"}

with %{is_admin: true, name: sender_name, email: sender_email} <- sending_user,
     %{name: receiver_name, email: receiver_email} <- receiving_user,
     %{title: title, body: body} <- email do
  "from #{sender_name}:#{sender_email} to #{receiver_name}:#{receiver_email} #{title}, #{body}"
else
  error -> "Email not sent because #{error} did not match expected format"
end
```

You can match multiple cases to handle different errors.

```elixir
sending_user = %{name: "Joker", email: "joker@jokesonyou.haha"}
receiving_user = %{name: "Robin", email: "boywonder@bat.net"}
email = %{title: "HAHA!", body: "HAHAHAHAHA"}

with %{is_admin: true, name: sender_name, email: sender_email} <- sending_user,
     %{name: receiver_name, email: receiver_email} <- receiving_user,
     %{title: title, body: body} <- email do
  "from #{sender_name}:#{sender_email} to #{receiver_name}:#{receiver_email} #{title}, #{body}"
else
  %{name: "Joker"} -> "Get out of here Joker!"
  error -> "Email not sent because #{error} did not match expected format"
end
```

`with` statements can use values from previous conditions in future conditions.

```elixir
triangle = [3, 3, 3]

with [side1, side2, side3] <- triangle, true <- side1 == side2 && side2 == side3 do
  "all sides are equal!"
end
```

### Your Turn

Use `with` to sum the numbers in two deeply nested maps. Return `{:error, :invalid}` if either input is invalid.

<!-- livebook:{"force_markdown":true} -->

```elixir
Sum.sum_maps(%{value: 10}, %{value: 10})
{:ok, 20}
```

<details style="background-color: lightgreen; padding: 1rem; margin: 1rem 0;">
<summary>Example Solution</summary>

```elixir
defmodule Sum do
  def sum_maps(map1, map2) do
    with %{value: value1} <- map1, %{value: value2} <- map2 do
      {:ok, value1 + value2}
    else
      _ -> {:error, :invalid}
    end
  end
end
```

</details>

```elixir
defmodule Sum do
  @doc """
  Sum two maps. Return {:ok, value} if valid, and {:error, :invalid} if either input is invalid.

  ## Examples

      iex> Sum.sum_maps(%{value: 10}, %{value: 10})
      {:ok, 20}

      iex> Sum.sum_maps(%{value: 20}, 10)
      {:error, :invalid}
  """
  def sum_maps(map1, map2) do
  end
end
```

## Commit Your Progress

DockYard Academy now recommends you use the latest [Release](https://github.com/DockYard-Academy/curriculum/releases) rather than forking or cloning our repository.

Run `git status` to ensure there are no undesirable changes.
Then run the following in your command line from the `curriculum` folder to commit your progress.

```
$ git add .
$ git commit -m "finish With reading"
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
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="https://github.com/DockYard-Academy/curriculum/issues/new?assignees=&labels=&template=issue.md&title=With">Report An Issue</a>
</div>
<div style="display: flex;">
<i class="ri-arrow-left-fill"></i>
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="../reading/guards.livemd">Guards</a>
</div>
<div style="display: flex;">
<a style="display: flex; color: #61758a; margin-right: 1rem;" href="../exercises/message_validation.livemd">Message Validation</a>
<i class="ri-arrow-right-fill"></i>
</div>
</div>

