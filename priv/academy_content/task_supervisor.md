%{
  title: "Task Supervisor"
}
---
# Task Supervisor

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

## Task Supervisor

We can start [Task](https://hexdocs.pm/elixir/Task.html) processes under a `Task.Supervisor` which can dynamically supervise tasks. The supervisor will automatically restart tasks if they encounter an error.

Generally speaking, we should start [Task](https://hexdocs.pm/elixir/Task.html) processes under a supervisor.

> We encourage developers to rely on supervised tasks as much as possible. Supervised tasks improves the visibility of how many tasks are running at a given moment and enable a huge variety of patterns that gives you explicit control on how to handle the results, errors, and timeouts. Here is a summary:
> 
> Using `Task.Supervisor.start_child/2` allows you to start a fire-and-forget task that you don't care about its results or if it completes successfully or not.
> 
> Using `Task.Supervisor.async/2 + Task.await/2` allows you to execute tasks concurrently and retrieve its result. If the task fails, the caller will also fail.
> 
> Using `Task.Supervisor.async_nolink/2` + [Task.yield/2](https://hexdocs.pm/elixir/Task.html#yield/2) + [Task.shutdown/2](https://hexdocs.pm/elixir/Task.html#shutdown/2) allows you to execute tasks concurrently and retrieve their results or the reason they failed within a given time frame. If the task fails, the caller won't fail. You will receive the error reason either on yield or shutdown.
> 
> * [Hexdocs: Dynamically Supervised Tasks](https://hexdocs.pm/elixir/Task.html#module-dynamically-supervised-tasks)

The `Task.Supervisor` is started as a child under a normal supervisor. We start the `Task.Supervisor` as a named process using an atom or a module name.

```elixir
children = [
  {Task.Supervisor, name: MyTaskSupervisor}
]

{:ok, supervisor_pid} =
  Supervisor.start_link(children, strategy: :one_for_one, name: :parent_supervisor)
```

We don't need to define a `MyTaskSupervisor` module. The supervisor uses this name to start a `Task.Supervisor` process. We can see that `MyTaskSupervisor` is a child process of our supervisor.

```elixir
Supervisor.which_children(supervisor_pid)
```

We can also see that demonstrated in the following diagram.

<!-- livebook:{"attrs":{"source":"Kino.Process.sup_tree(supervisor_pid)","title":"Supervisor Visualization"},"kind":"Elixir.HiddenCell","livebook_object":"smart_cell"} -->

```elixir
Kino.Process.sup_tree(supervisor_pid)
```

## Async Tasks

Now we can spawn supervised [Task](https://hexdocs.pm/elixir/Task.html) processes under `MyTaskSupervisor` using `Task.Supervisor.async/3`.

```elixir
task =
  Task.Supervisor.async(MyTaskSupervisor, fn ->
    IO.puts("Task Started")
    Process.sleep(1000)
    IO.puts("Task Finished")
    "response!"
  end)

Task.await(task)
```

We can spawn many tasks under the supervisor.

```elixir
tasks =
  Enum.map(1..5, fn int ->
    task =
      Task.Supervisor.async(MyTaskSupervisor, fn ->
        IO.puts("Task Started")
        Process.sleep(30000)
        IO.puts("Task Finished")
        int * 2
      end)
  end)
```

Evaluate the diagram below to see the tasks spawned under the `MyTaskSupervisor` process.

<!-- livebook:{"attrs":{"source":"Kino.Process.sup_tree(supervisor_pid)","title":"Supervisor Visualization"},"kind":"Elixir.HiddenCell","livebook_object":"smart_cell"} -->

```elixir
Kino.Process.sup_tree(supervisor_pid)
```

We can then await the response from all of the tasks.

```elixir
Task.await_many(tasks)
```

## Fire-and-Forget Tasks

`Task.Supervisor.start_child/2` allows us to start a **fire-and-forget** task that will perform some work without returning a response.

```elixir
Task.Supervisor.start_child(MyTaskSupervisor, fn ->
  IO.puts("Fire-and-forget task started")
  Process.sleep(60000)
  IO.puts("Fire-and-forget task finished")
end)
```

Re-evaluate the cell above a few times, and you'll see several tasks under the `MyTaskSupervisor`.

```elixir
children = Supervisor.which_children(MyTaskSupervisor)
```

We can provide a `:restart` strategy when we start a process. By default, `Task.Supervisor.start_child/2` uses the `:temporary` `:restart` strategy. These [Task](https://hexdocs.pm/elixir/Task.html) processes will never be restarted.

```elixir
{:ok, pid} =
  Task.Supervisor.start_child(MyTaskSupervisor, fn ->
    Process.sleep(60000)
  end)

Supervisor.which_children(MyTaskSupervisor)
|> IO.inspect(label: "Started children")

Process.exit(pid, :kill)

Process.sleep(1000)

Supervisor.which_children(MyTaskSupervisor)
|> IO.inspect(label: "Children after exit")
```

Instead we can use the `:permanent` process to always restart a [Task](https://hexdocs.pm/elixir/Task.html) or `:transient` to restart a [Task](https://hexdocs.pm/elixir/Task.html) if it's exit reason is not `:normal`, `:shutdown`, or `{:shutdown, reason}`.

See [Task.Supervisor.start_child/3#options](https://hexdocs.pm/elixir/Task.Supervisor.html#start_child/3-options) for more.

Now when we kill a [Task](https://hexdocs.pm/elixir/Task.html) started with the `:transient` strategy, notice that a new process with a different `pid` is started under `MyTaskSupervisor`.

```elixir
{:ok, pid} =
  Task.Supervisor.start_child(
    MyTaskSupervisor,
    fn ->
      Process.sleep(60000)
    end,
    restart: :transient
  )

Supervisor.which_children(MyTaskSupervisor)
|> IO.inspect(label: "Started children")

Process.exit(pid, :kill)

Process.sleep(1000)

Supervisor.which_children(MyTaskSupervisor)
|> IO.inspect(label: "Children after exit")
```

## Further Reading

Consider the following resource(s) to deepen your understanding of the topic.

* [HexDocs: Task.Supervisor](https://hexdocs.pm/elixir/Task.Supervisor.html)
* [ElixirSchools: Task.Supervisor](https://elixirschool.com/en/lessons/advanced/otp_supervisors#task-supervisor-4)

## Commit Your Progress

Run the following in your command line from the curriculum folder to track and save your progress in a Git commit.
Ensure that you do not already have undesired or unrelated changes by running `git status` or by checking the source control tab in Visual Studio Code.

```
$ git checkout main
$ git checkout -b exercise-task_supervisor
$ git add .
$ git commit -m "finish task supervisor section"
$ git push origin exercise-task_supervisor
```

Create a pull request to your forked `main` branch. Please do not create a pull request to the DockYard Academy repository as this will spam our PR tracker.

**DockYard Academy Students Only:**

Notify your teacher by including `@BrooklinJazz` in your PR description to get feedback.

If you are interested in joining the next academy cohort, [sign up here](https://academy.dockyard.com/) to receive more news when it is available.

## Up Next

| Previous                       | Next                                           |
| ------------------------------ | ---------------------------------------------: |
| [Task](../reading/task.livemd) | [Task Drills](../exercises/task_drills.livemd) |

