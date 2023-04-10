%{
  title: "Blog: Posts"
}
---
# Blog: Posts

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
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="https://github.com/DockYard-Academy/curriculum/issues/new?assignees=&labels=&template=issue.md&title=Blog: Posts">Report An Issue</a>
</div>
<div style="display: flex;">
<i class="ri-arrow-left-fill"></i>
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="../exercises/sql_drills.livemd">SQL Drills</a>
</div>
<div style="display: flex;">
<a style="display: flex; color: #61758a; margin-right: 1rem;" href="../reading/book_search_authors.livemd">BookSearch: Authors</a>
<i class="ri-arrow-right-fill"></i>
</div>
</div>

## Blog: Posts

You're going to create the `Posts` resource in your [Blog](./group_project_blog.livemd) project.

Blog posts should have a `title`, `subtitle`, and `content`. It should also have relevant timestamp information.

```mermaid
classDiagram
  class Post {
    title: :string
    subtitle: :string
    content: :text
  }
```

You may use [Phoenix Generators](https://hexdocs.pm/phoenix/Mix.Tasks.Phx.Gen.Html.html) or create the Controller, Context, and other infrastructure for the post resource or you may create it all from scratch.

<details style="background-color: lightgreen; padding: 1rem; margin: 1rem 0;">
<summary>Example Solution</summary>

Generate the resource.

```elixir
$ mix phx.gen.html Posts Post posts title:string subtitle:string content:text
$ mix ecto.migrate
```

Then add the resource to `router.ex`.

```elixir
scope "/", BlogWeb do
  pipe_through :browser

  get "/", PageController, :index
  resources "/posts", PostController
end
```

Alternatively we can define every route individually.

```elixir
scope "/", BlogWeb do
  pipe_through :browser

  get "/", PageController, :index
  get "/posts", PostController, :index
  get "/posts/new", PostController, :new
  post "/posts", PostController, :create
  get "/posts/:id", PostController, :show
  get "/posts/:id/edit", PostController, :edit
  put "/posts/:id", PostController, :update
  patch "/posts/:id", PostController, :update
  delete "/posts/:id", PostController, :delete
end
```

</details>

## Commit Your Progress

DockYard Academy now recommends you use the latest [Release](https://github.com/DockYard-Academy/curriculum/releases) rather than forking or cloning our repository.

Run `git status` to ensure there are no undesirable changes.
Then run the following in your command line from the `curriculum` folder to commit your progress.

```
$ git add .
$ git commit -m "finish Blog: Posts exercise"
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
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="https://github.com/DockYard-Academy/curriculum/issues/new?assignees=&labels=&template=issue.md&title=Blog: Posts">Report An Issue</a>
</div>
<div style="display: flex;">
<i class="ri-arrow-left-fill"></i>
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="../exercises/sql_drills.livemd">SQL Drills</a>
</div>
<div style="display: flex;">
<a style="display: flex; color: #61758a; margin-right: 1rem;" href="../reading/book_search_authors.livemd">BookSearch: Authors</a>
<i class="ri-arrow-right-fill"></i>
</div>
</div>

