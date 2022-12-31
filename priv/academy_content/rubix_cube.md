%{
  title: "Rubix Cube"
}
---
# Rubix Cube

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

## Rubix's Cube

You are going to create a Rubix Cube application.

[Rubix's Cubes](https://en.wikipedia.org/wiki/Rubik%27s_Cube) are a toy with six sides. Each side has nine colored squares on it.
Players rotate columns and rows on the cube with the goal of having each side with a single matching color.

<!-- livebook:{"break_markdown":true} -->

![](images/rubix.png)

<!-- livebook:{"break_markdown":true} -->

Create a `RubixCube` mix project. Your `RubixCube` project should have the following features:

### Requirements

* Represent the Rubix's Cube as data.
* Horizontally rotate a row of the cube to the right and left
* Vertically rotate a column of the cube up and down.
* Determine if a Rubix's Cube is solved.
* Save the state of the Rubix Cube using the [File](https://hexdocs.pm/elixir/File.html) system.

### Bonus Feature Ideas

You may add any additional features that you like. For example:

* Configure the project as a script and retrieve user input using [IO](https://hexdocs.pm/elixir/IO.html).
* Print the faces of the rubix cube in the terminal with colours using `IO.ANSI`.

If you need clarification of these instructions speak with your teacher. However, keep in mind the goal of this project is to engage your problem solving and decision skills. You should implement features how you think is best. You are free to be creative and take liberties or add new features to this project.

## Commit Your Progress

Run the following in your command line from the curriculum folder to track and save your progress in a Git commit.
Ensure that you do not already have undesired or unrelated changes by running `git status` or by checking the source control tab in Visual Studio Code.

```
$ git checkout main
$ git checkout -b exercise-rubix_cube
$ git add .
$ git commit -m "finish rubix cube exercise"
$ git push origin exercise-rubix_cube
```

Create a pull request to your forked `main` branch. Please do not create a pull request to the DockYard Academy repository as this will spam our PR tracker.

**DockYard Academy Students Only:**

Notify your teacher by including `@BrooklinJazz` in your PR description to get feedback.

If you are interested in joining the next academy cohort, [sign up here](https://academy.dockyard.com/) to receive more news when it is available.

## Up Next

| Previous                                                             | Next                                   |
| -------------------------------------------------------------------- | -------------------------------------: |
| [Advanced Score Tracker](../exercises/advanced_score_tracker.livemd) | [HTML CSS](../reading/html_css.livemd) |

