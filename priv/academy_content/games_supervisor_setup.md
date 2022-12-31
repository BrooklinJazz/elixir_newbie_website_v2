%{
  title: "Games: Supervisor Setup"
}
---
# Games: Supervisor Setup

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

## Games: Supervisor Setup

We've seen we can initialize a new mix project with a supervisor using  the `--sup` flag when we create a mix project.
Now, you're going to add a supervisor to your existing [Games](games_setup.livemd) project.

<!-- livebook:{"break_markdown":true} -->

### Configure Games.Application

Supervised Mix projects include an [Application](https://hexdocs.pm/elixir/Application.html#module-the-application-callback-module) module.

> ### **Application**
> 
> A module for working with applications and defining application callbacks.
> Applications are the idiomatic way to package software in Erlang/OTP. To get the idea, they are similar to the "library" concept common in other programming languages, but with some additional characteristics.
> An application is a component implementing some specific functionality, with a standardized directory structure, configuration, and life cycle. Applications are loaded, started, and stopped. Each application also has its own environment, which provides a unified API for configuring each application.
> 
> [HexDocs: Application](https://hexdocs.pm/elixir/Application.html)

Create a `lib/games/application.ex` file with the following content. This will be the callback function that starts your application supervisor.

We've included an [IO.puts/2](https://hexdocs.pm/elixir/IO.html#puts/2) statement to demonstrate that the supervisor does start. This is not strictly necessary but will allow you to test that you have configured this correctly later.

<!-- livebook:{"force_markdown":true} -->

```elixir
defmodule Games.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    IO.puts("Starting Games.Application")
    children = []

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Games.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
```

<!-- livebook:{"break_markdown":true} -->

### Configure Games.MixProject

In `lib/mix.exs` configure the application callback module using the `:mod` option in the `Games.MixProject.application/1` function. This tells your mix project to run the `Games.Application.start/2` function you just defined.

<!-- livebook:{"force_markdown":true} -->

```elixir
def application do
  [
    extra_applications: [:logger],
    mod: {Games.Application, []}
  ]
end
```

Test your application from the command line by running `mix run`. You should see your [IO.puts/2](https://hexdocs.pm/elixir/IO.html#puts/2) message confirming the application does start the supervisor.

```
$ mix run
Compiling 1 file (.ex)
Starting Games.Application
```

The same will print if you start the application in the [IEx](https://hexdocs.pm/iex/IEx.html) shell.

```
$ iex -S mix
...
Starting Games.Application
...
```

## Commit Your Progress

Run the following in your command line from the curriculum folder to track and save your progress in a Git commit.
Ensure that you do not already have undesired or unrelated changes by running `git status` or by checking the source control tab in Visual Studio Code.

```
$ git checkout main
$ git checkout -b exercise-games_supervisor_setup
$ git add .
$ git commit -m "finish games supervisor setup exercise"
$ git push origin exercise-games_supervisor_setup
```

Create a pull request to your forked `main` branch. Please do not create a pull request to the DockYard Academy repository as this will spam our PR tracker.

**DockYard Academy Students Only:**

Notify your teacher by including `@BrooklinJazz` in your PR description to get feedback.

If you are interested in joining the next academy cohort, [sign up here](https://academy.dockyard.com/) to receive more news when it is available.

## Up Next

| Previous                                                                               | Next                                                                                 |
| -------------------------------------------------------------------------------------- | -----------------------------------------------------------------------------------: |
| [Supervisor And GenServer Drills](../exercises/supervisor_and_genserver_drills.livemd) | [Games Supervised Score Tracker](../exercises/games_supervised_score_tracker.livemd) |

