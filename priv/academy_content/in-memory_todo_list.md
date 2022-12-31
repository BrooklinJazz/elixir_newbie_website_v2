%{
  title: "In-Memory TodoList"
}
---
# In-Memory Todo List

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

## In-Memory Todo List

You're going to create a `TodoList` Phoenix web application.

First, create a new Phoenix project.

```
$ mix phx.new todo_list
```

Then implement each requirement.

### Requirements

* A user can see a list of todo items.
* A user can add an item to the todo list.
* The todo list should be stored in-memory in a process under the application's supervision tree.

### Bonus:

* A user can update a todo item
* A user can delete a todo item

## Commit Your Progress

Run the following in your command line from the curriculum folder to track and save your progress in a Git commit.
Ensure that you do not already have undesired or unrelated changes by running `git status` or by checking the source control tab in Visual Studio Code.

```
$ git checkout main
$ git checkout -b exercise-in-memory_todo_list
$ git add .
$ git commit -m "finish in-memory todo list exercise"
$ git push origin exercise-in-memory_todo_list
```

Create a pull request to your forked `main` branch. Please do not create a pull request to the DockYard Academy repository as this will spam our PR tracker.

**DockYard Academy Students Only:**

Notify your teacher by including `@BrooklinJazz` in your PR description to get feedback.

If you are interested in joining the next academy cohort, [sign up here](https://academy.dockyard.com/) to receive more news when it is available.

