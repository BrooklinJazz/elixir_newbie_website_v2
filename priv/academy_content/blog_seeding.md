%{
  title: "Blog: Seeding"
}
---
# Blog: Seeding

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

## Blog: Seeding

You're going to create a seed file for your existing [Blog](./blog_setup.livemd) project.
The seed file should:

You should have blog posts associated with comments. If not, you can generate the project with the following command.

<!-- livebook:{"force_markdown":true} -->

```elixir
$ mix phx.new blog
$ mix phx.gen.html Posts Post posts title:string subtitle:string content:text
$ mix phx.gen.html Comments Comment comments content:text post_id:references:posts
$ mix ecto.migrate
```

Ideally, you should complete the previous [Blog: Comments](./blog_comments.livemd) exercise. However, it is not strictly necessary.

<!-- livebook:{"break_markdown":true} -->

### Blog: Seeding

Use the `priv/repo/seeds.exs` file to seed your database with:

1. A blog post without any comments.
2. A blog post with an associated comment.

Once complete, use your seed file to seed the database.

```
$ mix ecto.reset
```

Then display comments on your `Post` show page.

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
git commit -m "seed comments and posts and add comments to posts"
git push
```

<!-- livebook:{"break_markdown":true} -->

### Bonus: Faker

Add [Faker](https://hexdocs.pm/faker/readme.html) as a dependency in your project.

Then use Faker to create a post with a large amount of text and a comment with a large amount of text.

<!-- livebook:{"break_markdown":true} -->

### Bonus: Create 100 Posts

Create a new seed file that will generate 100 posts.

<!-- livebook:{"break_markdown":true} -->

### Bonus: Create A Post With 100 Comments

Create a new seed file that will generate a post with 100 comments.

## Commit Your Progress

Run the following in your command line from the curriculum folder to track and save your progress in a Git commit.
Ensure that you do not already have undesired or unrelated changes by running `git status` or by checking the source control tab in Visual Studio Code.

```
$ git checkout main
$ git checkout -b exercise-blog_seeding
$ git add .
$ git commit -m "finish blog seeding exercise"
$ git push origin exercise-blog_seeding
```

Create a pull request to your forked `main` branch. Please do not create a pull request to the DockYard Academy repository as this will spam our PR tracker.

**DockYard Academy Students Only:**

Notify your teacher by including `@BrooklinJazz` in your PR description to get feedback.

If you are interested in joining the next academy cohort, [sign up here](https://academy.dockyard.com/) to receive more news when it is available.

## Up Next

| Previous                                                     | Next                                                             |
| ------------------------------------------------------------ | ---------------------------------------------------------------: |
| [Book Search Seeding](../reading/book_search_seeding.livemd) | [Book Search Book Form](../reading/book_search_book_form.livemd) |

