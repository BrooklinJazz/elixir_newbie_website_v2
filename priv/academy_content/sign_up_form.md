%{
  title: "Sign Up Form"
}
---
# Sign Up Form

```elixir
Mix.install([
  {:kino, "~> 0.7.0", override: true},
  {:youtube, github: "brooklinjazz/youtube"},
  {:hidden_cell, github: "brooklinjazz/hidden_cell"},
  {:ecto, "~> 3.9"}
])
```

## Navigation

[Return Home](../start.livemd)<span style="padding: 0 30px"></span>
[Report An Issue](https://github.com/DockYard-Academy/beta_curriculum/issues/new?assignees=&labels=&template=issue.md&title=)

## User Changeset

Create a `User` schemaless changeset that validates a user.

A user struct should have the following fields.

* `username` (required) a 3-12 character string.
* `password` (required) a 12-50 character string.
* `age` an integer.
* `birthdate` a date.
* `terms_and_conditions` (required) a boolean which must be `true`.

<details style="background-color: lightgreen; padding: 1rem; margin: 1rem 0;">
<summary>Example Solution</summary>

```elixir
defmodule User do
  defstruct [:username, :password, :age, :birthdate, :terms_and_conditions]

  @types %{
    username: :string,
    password: :string,
    age: :integer,
    birthdate: :date,
    terms_and_conditions: :boolean
  }

  @doc """
  Create a User changeset.

  ## Examples

      iex> User.changeset(%User{}, %{username: "user1", password: "securepassword1", age: 20, terms_and_conditions: true})
      #Ecto.Changeset<action: nil, changes: %{age: 20, password: "securepassword1", terms_and_conditions: true, username: "user1"}, errors: [], data: #User<>, valid?: true>
  """
  def changeset(%__MODULE__{} = user, params) do
    {user, @types}
    |> Ecto.Changeset.cast(params, Map.keys(@types))
    |> Ecto.Changeset.validate_required([:username, :password])
    |> Ecto.Changeset.validate_length(:username, min: 3, max: 12)
    |> Ecto.Changeset.validate_length(:password, min: 12, max: 50)
    |> Ecto.Changeset.validate_acceptance(:terms_and_conditions)
  end

  @doc """
  Validate and create a User struct.

  ## Examples

      iex> User.new(%{username: "user1", password: "securepassword1", age: 20, terms_and_conditions: true})
      {:ok, %User{username: "user1", password: "securepassword1", age: 20, terms_and_conditions: true}}

      Terms and conditions must be signed.

      User.new(%{username: "user1", password: "securepassword1", age: 20, terms_and_conditions: false})
      {:error, _changeset}
  """
  def new(params) do
    %__MODULE__{}
    |> changeset(params)
    |> Ecto.Changeset.apply_action(:update)
  end
end
```

</details>

```elixir
defmodule User do
  @moduledoc """
  Documentation for `User`

  Defines a schemaless changeset and `User` struct.

  ## Examples

      iex> %User{}
      %User{username: nil, password: nil, age: nil, birthdate: nil, terms_and_conditions: nil}
  """
  defstruct []

  @types %{}

  @doc """
  Create a User changeset.

  ## Examples

      iex> User.changeset(%User{}, %{username: "user1", password: "securepassword1", age: 20, terms_and_conditions: true})
      #Ecto.Changeset<action: nil, changes: %{age: 20, password: "securepassword1", terms_and_conditions: true, username: "user1"}, errors: [], data: #User<>, valid?: true>
  """
  def changeset(%__MODULE__{} = user, params) do
  end

  @doc """
  Validate and create a User struct.

  ## Examples

      iex> User.new(%{username: "user1", password: "securepassword1", age: 20, terms_and_conditions: true})
      {:ok, %User{username: "user1", password: "securepassword1", age: 20, terms_and_conditions: true}}

      Terms and conditions must be signed.

      User.new(%{username: "user1", password: "securepassword1", age: 20, terms_and_conditions: false})
      {:error, _changeset}
  """
  def new(params) do
  end
end
```

## Sign Up Form

You're going to create a `SignUp` application that validates user data with a sign up form.
Create a sign up form with appropriate form fields for the `User` changeset.

```
$ mix phx.new sign_up
```

Use the `User` changeset to provide error feedback on each of the form inputs `:username`, `:password`, `:age`, `:birthdate`, and `:terms_and_conditions`.

## Commit Your Progress

Run the following in your command line from the curriculum folder to track and save your progress in a Git commit.
Ensure that you do not already have undesired or unrelated changes by running `git status` or by checking the source control tab in Visual Studio Code.

```
$ git checkout main
$ git checkout -b exercise-sign_up_form
$ git add .
$ git commit -m "finish sign up form exercise"
$ git push origin exercise-sign_up_form
```

Create a pull request to your forked `main` branch. Please do not create a pull request to the DockYard Academy repository as this will spam our PR tracker.

**DockYard Academy Students Only:**

Notify your teacher by including `@BrooklinJazz` in your PR description to get feedback.

If you are interested in joining the next academy cohort, [sign up here](https://academy.dockyard.com/) to receive more news when it is available.

## Up Next

| Previous                                           | Next                                                 |
| -------------------------------------------------- | ---------------------------------------------------: |
| [Ecto Changeset](../reading/ecto_changeset.livemd) | [Book Changeset](../exercises/book_changeset.livemd) |

