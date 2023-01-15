%{
  title: "Blog: Comment Form"
}
---
# Blog: Comment

```elixir
Mix.install([
  {:kino, "~> 0.7.0", override: true},
  {:youtube, github: "brooklinjazz/youtube"},
  {:hidden_cell, github: "brooklinjazz/hidden_cell"}
])
```

## Navigation

[Return Home](../start.livemd)<span style="padding: 0 30px"></span>
[Report An Issue](https://github.com/DockYard-Academy/beta_curriculum/issues/new)

## Blog: Comment Form

You're going to add comment for for each post in your existing [Blog](./blog_setup.livemd) project.

<!-- livebook:{"break_markdown":true} -->

### Requirements

Create a form on the post show page to comment on a post.
The comment should automatically be associated with the post.

<!-- livebook:{"break_markdown":true} -->

### Bonus: Delete Comments

Add a "delete" button on every comment that will delete them from the database and re-render the post show page.

<!-- livebook:{"break_markdown":true} -->

### Bonus: Edit Comments

Add an "Edit" button on every comment that displays an input to edit the comment contents.

## Push to GitHub

Ensure all of your tests pass.

```
mix test
```

**ONLY If you cloned the project**: remove the existing `.git` folder, and re-initialize the project.

```
$ rm -rf .git
$ git init
```

[Create a new GitHub repository](https://github.com/new) and follow the instructions to connect your local project to your new remote project.

Stage, commit, and push your changes to GitHub.

```
git add .
git commit -m "associate books with authors"
git push
```

<!-- livebook:{"break_markdown":true} -->

## Commit Your Progress

Run the following in your command line from the curriculum folder to track and save your progress in a Git commit.
Ensure that you do not already have undesired or unrelated changes by running `git status` or by checking the source control tab in Visual Studio Code.

```
$ git checkout main
$ git checkout -b exercise-blog_comment_form
$ git add .
$ git commit -m "finish blog comment form exercise"
$ git push origin exercise-blog_comment_form
```

Create a pull request to your forked `main` branch. Please do not create a pull request to the DockYard Academy repository as this will spam our PR tracker.

**DockYard Academy Students Only:**

Notify your teacher by including `@BrooklinJazz` in your PR description to get feedback.

If you are interested in joining the next academy cohort, [sign up here](https://academy.dockyard.com/) to receive more news when it is available.

## Up Next

| Previous                                                         | Next                                                               |
| ---------------------------------------------------------------- | -----------------------------------------------------------------: |
| [Book Search Book Form](../reading/book_search_book_form.livemd) | [Phoenix Authentication](../reading/phoenix_authentication.livemd) |

