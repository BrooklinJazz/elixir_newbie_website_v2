%{
  title: "Blog: Comments"
}
---
# Blog: Comments

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

## Blog: Comments

You're going to create a `comments` table to your existing [Blog](./blog_setup.livemd) project.

If you do not already have an existing blog project, you can create one with the following commands:

```
$ mix phx.new blog
$ mix phx.gen.html Posts Post posts title:string subtitle:string content:text
$ mix ecto.migrate
```

Ideally, you should complete the [Blog: Migration](./blog_migration.livemd) exercise before this exercise. However, it is not strictly necessary.

<!-- livebook:{"break_markdown":true} -->

### Comment/Post Association

A comment should **belong to** a blog post and a blog post should **have_many** comments.

Comments should have `:content`, and `:post_id` (foreign key) fields.

```mermaid
classDiagram
  class Comment {
    post_id: :id
    content: :text
  }
```

<details style="background-color: burlywood; padding: 1rem; margin: 1rem 0;">
<summary>Hint</summary>

You will need to:
1. Create the comments resource and run migrations.

```
$ mix phx.gen.html Comments Comment comments content:text post_id:references:posts
$ mix ecto.migrate
```

2. Define the [has_many/3](https://hexdocs.pm/ecto/Ecto.Schema.html#has_many/3) relationship in the `Post` schema.

3. Define the [belongs_to/3](https://hexdocs.pm/ecto/Ecto.Schema.html#belongs_to/3) relationship in the `Comment` schema.

</details>

Once complete use the IEx shell to do the following:

* Create a new blog post.
* Use [build_assoc/3](https://hexdocs.pm/ecto/Ecto.html#build_assoc/3) to create a comment associated with your created blog post.
* Use [put_assoc/4](https://hexdocs.pm/ecto/Ecto.Changeset.html#put_assoc/4) to create a new blog post and create multiple comments associated with the blog post.
* Use [put_assoc/4](https://hexdocs.pm/ecto/Ecto.Changeset.html#put_assoc/4) to add a comment to one of your existing blog posts.
* Use [cast_assoc/3](https://hexdocs.pm/ecto/Ecto.Changeset.html#cast_assoc/3) to create a new blog post and create multiple comments associated with the blog post.

<!-- livebook:{"break_markdown":true} -->

### Push to GitHub

From the `blog` folder run the following commands.

First, ensure that all tests pass.

```
mix test
```

Then stage and commit your changes to the Blog project.

```
git add .
git commit -m "add comments to posts"
git push
```

## Commit Your Progress

Run the following in your command line from the curriculum folder to track and save your progress in a Git commit.
Ensure that you do not already have undesired or unrelated changes by running `git status` or by checking the source control tab in Visual Studio Code.

```
$ git checkout main
$ git checkout -b exercise-blog_comments
$ git add .
$ git commit -m "finish blog comments exercise"
$ git push origin exercise-blog_comments
```

Create a pull request to your forked `main` branch. Please do not create a pull request to the DockYard Academy repository as this will spam our PR tracker.

**DockYard Academy Students Only:**

Notify your teacher by including `@BrooklinJazz` in your PR description to get feedback.

If you are interested in joining the next academy cohort, [sign up here](https://academy.dockyard.com/) to receive more news when it is available.

## Up Next

| Previous                                                 | Next                                                         |
| -------------------------------------------------------- | -----------------------------------------------------------: |
| [Book Search Books](../reading/book_search_books.livemd) | [Book Search Seeding](../reading/book_search_seeding.livemd) |

