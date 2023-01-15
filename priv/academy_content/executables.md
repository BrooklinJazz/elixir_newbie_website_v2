%{
  title: "Executables"
}
---
# Executables

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

## Setup

Ensure you type the `ea` keyboard shortcut to evaluate all Elixir cells before starting. Alternatively you can evaluate the Elixir cells as you read.

## Executables

We can configure mix projects to run as an executable script using escript.

Once configured, we can run a mix project using an executable file inside of the project folder.

```
./project_name
```

To demonstrate how to configure an executable, We're going to create a simple `greeting` executable which prints a good morning message.

Create a new mix project.

```
$ mix new greeting
```

First, we need to define a module with a `main/1` function. This function will be what's triggered by the executable.
We can modify the existing `Greeting` module in `lib/greeting.ex`.

```elixir
defmodule Greeting do
  def main(_args) do
    IO.puts("Good morning!")
  end
end
```

<div style="background-color: orange; font-weight: bold; padding: 1rem; color: black; margin: 1rem 0;">
Remove doctests and the existing `test` macros to ensure all tests pass when you run `mix test`.
</div>

<!-- livebook:{"break_markdown":true} -->

In any mix project, we can configure an executable using the `:escript` option in the `mix.exs` file.
Add the `:escript` configuration to the existing `project/0` function.

We've defined our `main/1` function in the `Greeting` module, so we provide that as our `:main_module`.

<!-- livebook:{"force_markdown":true} -->

```elixir
def project do
  # make sure you keep existing configuration
  escript: [main_module: Greeting]
end
```

Now we have to build the executable script from the `greeting` folder.

```
$ mix escript.build
```

Execute the script to see the good morning message.

```
$ ./greeting
Good morning!
```

## Parsing Arguments

We can provide arguments to executable scripts using `--arg_name` flags. A flag can be empty, or it can have a value `--arg_name=true`.

Elixir provides an [OptionParser](https://hexdocs.pm/elixir/OptionParser.html) module to parse arguments provided to the script into Elixir terms.

```elixir
OptionParser.parse(["--flag=true"], switches: [flag: :boolean])
```

If the `:boolean` type is given, flags are true by default when provided.

```elixir
OptionParser.parse(["--flag=true"], switches: [flag: :boolean])
```

Or we can set them to false.

```elixir
OptionParser.parse(["--flag=false"], switches: [flag: :boolean])
```

Arguments may have different [types](https://hexdocs.pm/elixir/1.12/OptionParser.html#parse/2-types) such as `:boolean`, `:count`, `:integer`, `:float`, and `:string`.

```elixir
OptionParser.parse(["--time=hello"], switches: [time: :string])
```

```elixir
OptionParser.parse(["--flag=hello"], switches: [flag: :string])
```

For example, we can use a `--time` flag to change the greeting based on the time of day.

```elixir
defmodule Greeting do
  def main(args) do
    {opts, _word, _errors} = OptionParser.parse(args, switches: [time: :string])
    IO.puts("Good #{opts[:time] || "morning"}!")
  end
end
```

Now rebuild the script, and you can customize the message using the `--time` flag.

```
$ mix escript.build
$ ./greeting --time="evening"
Good evening!
```

<!-- livebook:{"break_markdown":true} -->

### Your Turn

Create an `--upcase` flag, which upcases the greeting so `"Good morning!` becomes `GOOD MORNING!`.

<!-- livebook:{"break_markdown":true} -->

### BONUS: GitHub Repository

Connect your `greeting` project with a GitHub repository to add it to your portfolio of projects. Update the README to include a description of the project and what you learned.

## Commit Your Progress

Run the following in your command line from the curriculum folder to track and save your progress in a Git commit.
Ensure that you do not already have undesired or unrelated changes by running `git status` or by checking the source control tab in Visual Studio Code.

```
$ git checkout main
$ git checkout -b exercise-executables
$ git add .
$ git commit -m "finish executables section"
$ git push origin exercise-executables
```

Create a pull request to your forked `main` branch. Please do not create a pull request to the DockYard Academy repository as this will spam our PR tracker.

**DockYard Academy Students Only:**

Notify your teacher by including `@BrooklinJazz` in your PR description to get feedback.

If you are interested in joining the next academy cohort, [sign up here](https://academy.dockyard.com/) to receive more news when it is available.

## Up Next

| Previous                                                                                               | Next                                         |
| ------------------------------------------------------------------------------------------------------ | -------------------------------------------: |
| [Games Documentation And Static Analysis](../exercises/games_documentation_and_static_analysis.livemd) | [Games Menu](../exercises/games_menu.livemd) |

