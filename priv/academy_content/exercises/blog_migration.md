%{
  title: "Blog: Visibility Migration"
}
---
# Blog: Migration

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
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="https://github.com/DockYard-Academy/curriculum/issues/new?assignees=&labels=&template=issue.md&title=Blog: Migration">Report An Issue</a>
</div>
<div style="display: flex;">
<i class="ri-arrow-left-fill"></i>
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="../reading/schemas_and_migrations.livemd">Schemas And Migrations</a>
</div>
<div style="display: flex;">
<a style="display: flex; color: #61758a; margin-right: 1rem;" href="../reading/book_search_books.livemd">Book Search: Books</a>
<i class="ri-arrow-right-fill"></i>
</div>
</div>

## Blog: Migration

Your existing [Blog](./group_project_blog.livemd) application should already have blog posts with a `title`, `subtitle`, and `content`.

<!-- livebook:{"break_markdown":true} -->

### Blog Post Migration

You're going to create a migration or many migrations to modify the blog posts table with the following changes:

* Remove the `subtitle` field
* Add a `published_on` `:date` field.
* Add a `visible` `:boolean` field which defaults to `true`.

Ensure your `Post` schema reflects these changes, and ensure all tests pass. Modify existing tests to include the new fields.

Ensure all features of your application such as creating, reading, updating, and deleting posts continue to work. You will likely need to modify any pages using old fields that are no longer valid.

<!-- livebook:{"break_markdown":true} -->

### Form Fields

Add a date input for the `published_on` field, and a checkbox input for the `visible` field.

Use the IEx shell to view all `Post` records to ensure your form correctly creates a blog post.

```
iex -S mix
```

<!-- livebook:{"break_markdown":true} -->

### Visibility

When displaying a list of blog posts, hide any blog posts whose `visible` field is `false` or whose `published_on` field is after the current UTC date.

<!-- livebook:{"break_markdown":true} -->

### Push To GitHub

From the `blog` folder run the following commands.

First, ensure that all tests pass.

```
mix test
```

Then create a pull request, review it, and merge it into your main branch.

<!-- livebook:{"break_markdown":true} -->

### Bonus: Constraints

Create another migration to add the following constraints:

* Modify the title field to be unique.
* Modify the `title` so it must be between `3` and `100` characters.

Ensure your `Post` schema reflects these constraints and validations.

## Commit Your Progress

DockYard Academy now recommends you use the latest [Release](https://github.com/DockYard-Academy/curriculum/releases) rather than forking or cloning our repository.

Run `git status` to ensure there are no undesirable changes.
Then run the following in your command line from the `curriculum` folder to commit your progress.

```
$ git add .
$ git commit -m "finish Blog: Migration exercise"
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
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="https://github.com/DockYard-Academy/curriculum/issues/new?assignees=&labels=&template=issue.md&title=Blog: Migration">Report An Issue</a>
</div>
<div style="display: flex;">
<i class="ri-arrow-left-fill"></i>
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="../reading/schemas_and_migrations.livemd">Schemas And Migrations</a>
</div>
<div style="display: flex;">
<a style="display: flex; color: #61758a; margin-right: 1rem;" href="../reading/book_search_books.livemd">Book Search: Books</a>
<i class="ri-arrow-right-fill"></i>
</div>
</div>

