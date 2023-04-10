%{
  title: "Blog: Authentication"
}
---
# Blog: Authentication

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
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="https://github.com/DockYard-Academy/curriculum/issues/new?assignees=&labels=&template=issue.md&title=Blog: Authentication">Report An Issue</a>
</div>
<div style="display: flex;">
<i class="ri-arrow-left-fill"></i>
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="../reading/phoenix_authentication.livemd">Phoenix Authentication</a>
</div>
<div style="display: flex;">
<a style="display: flex; color: #61758a; margin-right: 1rem;" href="../reading/book_search_tags.livemd">Book Search: Tags</a>
<i class="ri-arrow-right-fill"></i>
</div>
</div>

## Blog: Authentication

You're going to add authentication and authorization to your existing [Blog](./group_project_blog.livemd) project.

Use the `mix phx.gen.auth` command to generate the initial authentication system.

```
mix phx.gen.auth Accounts User users
```

All users should be able to view all blogs, however only authorized users should be able to create, edit, and update their own blogs.

<!-- livebook:{"break_markdown":true} -->

### Authorization Requirements

Ensure you:

* Associate blogs with a user. Blogs should belong to a user.
* Allow all clients to access the `:index` and `:show` actions for blogs.
* Allow only authenticated users to access the `:new`, and `:create` actions.
* Allow only authorized users to access the `:edit`, `:update`, and `:delete` actions only for their own blogs.

<!-- livebook:{"break_markdown":true} -->

### Bonus: Authorized Comments

Add the same authorization for comments.

Ensure you:

* Associate comments with a user. Comments should belong to a user and a blog.
* Allow all clients to read all comments.
* Allow only authenticated users to create comments.
* Allow only authorized users to edit and delete their own comments.

## Commit Your Progress

DockYard Academy now recommends you use the latest [Release](https://github.com/DockYard-Academy/curriculum/releases) rather than forking or cloning our repository.

Run `git status` to ensure there are no undesirable changes.
Then run the following in your command line from the `curriculum` folder to commit your progress.

```
$ git add .
$ git commit -m "finish Blog: Authentication exercise"
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
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="https://github.com/DockYard-Academy/curriculum/issues/new?assignees=&labels=&template=issue.md&title=Blog: Authentication">Report An Issue</a>
</div>
<div style="display: flex;">
<i class="ri-arrow-left-fill"></i>
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="../reading/phoenix_authentication.livemd">Phoenix Authentication</a>
</div>
<div style="display: flex;">
<a style="display: flex; color: #61758a; margin-right: 1rem;" href="../reading/book_search_tags.livemd">Book Search: Tags</a>
<i class="ri-arrow-right-fill"></i>
</div>
</div>

