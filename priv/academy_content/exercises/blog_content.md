%{
  title: "Blog: Blog Content"
}
---
# Blog: Blog Content

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
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="https://github.com/DockYard-Academy/curriculum/issues/new?assignees=&labels=&template=issue.md&title=Blog: Blog Content">Report An Issue</a>
</div>
<div style="display: flex;">
<i class="ri-arrow-left-fill"></i>
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="../reading/book_search_book_content.livemd">Book Search: Book Content</a>
</div>
<div style="display: flex;">
<a style="display: flex; color: #61758a; margin-right: 1rem;" href="../reading/book_search_deployment.livemd">Book Search: Deployment</a>
<i class="ri-arrow-right-fill"></i>
</div>
</div>

## Blog: Blog Content

In your [Blog](group_project_blog.livemd) project, you're going to separate each blog posts `content` field into a separate `PostContent` resource. `PostContent` will have a one-to-one relationship with your blog `Post` resource.

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

### Post Schema And Migration

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

### Bonus: Migrate The `:content` Field Into `PostContent`.

Create a migration that will create an associated `PostContent` record for every existing `Post` record using their `:content` field. Then in the same migration, remove the `:content` field from every post.

This simulates a real-world production system where you would likely need to preserve existing data.

Make sure you also update any places in your codebase using the `:content` field to avoid errors. For example you likely need to fix your seed files, tests, templates, etc.

## Commit Your Progress

DockYard Academy now recommends you use the latest [Release](https://github.com/DockYard-Academy/curriculum/releases) rather than forking or cloning our repository.

Run `git status` to ensure there are no undesirable changes.
Then run the following in your command line from the `curriculum` folder to commit your progress.

```
$ git add .
$ git commit -m "finish Blog: Blog Content exercise"
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
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="https://github.com/DockYard-Academy/curriculum/issues/new?assignees=&labels=&template=issue.md&title=Blog: Blog Content">Report An Issue</a>
</div>
<div style="display: flex;">
<i class="ri-arrow-left-fill"></i>
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="../reading/book_search_book_content.livemd">Book Search: Book Content</a>
</div>
<div style="display: flex;">
<a style="display: flex; color: #61758a; margin-right: 1rem;" href="../reading/book_search_deployment.livemd">Book Search: Deployment</a>
<i class="ri-arrow-right-fill"></i>
</div>
</div>

