%{
  title: "Blog: Authentication"
}
---
# Blog: Authentication

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

## Blog: Authentication

You're going to add authentication to your existing [Blog](./blog_setup.livemd) project.

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

* Associate comments with a user. Comments should belong to a user.
* Allow all clients to read all comments.
* Allow only authenticated users to create comments.
* Allow only authorized users to edit and delete their own comments.

## Commit Your Progress

Run the following in your command line from the curriculum folder to track and save your progress in a Git commit.
Ensure that you do not already have undesired or unrelated changes by running `git status` or by checking the source control tab in Visual Studio Code.

```
$ git checkout main
$ git checkout -b exercise-blog_authentication
$ git add .
$ git commit -m "finish blog authentication exercise"
$ git push origin exercise-blog_authentication
```

Create a pull request to your forked `main` branch. Please do not create a pull request to the DockYard Academy repository as this will spam our PR tracker.

**DockYard Academy Students Only:**

Notify your teacher by including `@BrooklinJazz` in your PR description to get feedback.

If you are interested in joining the next academy cohort, [sign up here](https://academy.dockyard.com/) to receive more news when it is available.

## Up Next

| Previous                                                           | Next                                                   |
| ------------------------------------------------------------------ | -----------------------------------------------------: |
| [Phoenix Authentication](../reading/phoenix_authentication.livemd) | [Book Search Tags](../reading/book_search_tags.livemd) |

