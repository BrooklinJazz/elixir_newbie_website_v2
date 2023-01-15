%{
  title: "Blog: Blog Content"
}
---
# Blog: Blog Content

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

## Blog: Blog Content

You're going to separate each blog posts `content` field into a separate `PostContent` resource.
`PostContent` will have a one-to-one relationship with your blog `Post` resource.

Each `PostContent` record should store a `full_text` field and a foreign key to a post record.

```mermaid
classDiagram
  class PostContent {
    full_text: :text
    post_id: :id
  }
```

<!-- livebook:{"break_markdown":true} -->

### Requirements

Ensure you:

* Create a `post_content` table in a migration.
* Create a `PostContent` schema.
* Can create a `Post` with associated `PostContent` through your existing post form.
* Can update a `Post` with associated `PostContent` through your existing post form.
* Display the post content on the blog post show page.

You do not need to remove the existing `:content` field on the blog post. See the bonus exercise below.

<details style="background-color: burlywood; padding: 1rem; margin: 1rem 0;">
<summary>Hint</summary>

### Post Schema and Migration

You can use the following command to generate the `PostContent` schema and migration boilerplate.

```
$ mix phx.gen.schema Blog.PostContent post_content full_text:text post_id:references:posts
```

### Post Form

You can use `inputs_for/3` to create the associated `post_content` field.

### PostContent Association

You can associate `PostContent` with `Post` using `has_one/3` and `belongs_to/3`.

### Creating Associated Post Content

You can use `cast_assoc/3` inside of the `Post` schema's `changeset/2` function to create the associated `:post_content`.

### Updating Associated Post Content

Ensure you preload the `:post_content` using `Repo.preload/3` whenever updating a post.

</details>

<!-- livebook:{"break_markdown":true} -->

### Bonus: Migrate the `:content` Field Into `PostContent`.

Create a migration that will create an associated `PostContent` record for every existing `Post` record using their `:content` field. Then in the same migration, remove the `:content` field from every post.

This simulates a real-world production system where you would likely need to preserve existing data.

Make sure you also update any places in your codebase using the `:content` field to avoid errors. For example you likely need to fix your seed files, tests, templates, etc.

## Commit Your Progress

Run the following in your command line from the curriculum folder to track and save your progress in a Git commit.
Ensure that you do not already have undesired or unrelated changes by running `git status` or by checking the source control tab in Visual Studio Code.

```
$ git checkout main
$ git checkout -b exercise-blog_content
$ git add .
$ git commit -m "finish blog content exercise"
$ git push origin exercise-blog_content
```

Create a pull request to your forked `main` branch. Please do not create a pull request to the DockYard Academy repository as this will spam our PR tracker.

**DockYard Academy Students Only:**

Notify your teacher by including `@BrooklinJazz` in your PR description to get feedback.

If you are interested in joining the next academy cohort, [sign up here](https://academy.dockyard.com/) to receive more news when it is available.

## Up Next

| Previous                                                               | Next                                                               |
| ---------------------------------------------------------------------- | -----------------------------------------------------------------: |
| [Book Search Book Content](../reading/book_search_book_content.livemd) | [Book Search Deployment](../reading/book_search_deployment.livemd) |

