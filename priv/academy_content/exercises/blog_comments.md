%{
  title: "Blog: Comments"
}
---
# Blog: Comments

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
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="https://github.com/DockYard-Academy/curriculum/issues/new?assignees=&labels=&template=issue.md&title=Blog: Comments">Report An Issue</a>
</div>
<div style="display: flex;">
<i class="ri-arrow-left-fill"></i>
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="../reading/book_search_books.livemd">Book Search: Books</a>
</div>
<div style="display: flex;">
<a style="display: flex; color: #61758a; margin-right: 1rem;" href="../reading/book_search_seeding.livemd">BookSearch: Seeding</a>
<i class="ri-arrow-right-fill"></i>
</div>
</div>

## Blog: Comments

You're going to create a `comments` table to your existing [Blog](./blog_posts.livemd) project. You do not yet need to create the appropriate UI for creating a comment.

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

## Commit Your Progress

DockYard Academy now recommends you use the latest [Release](https://github.com/DockYard-Academy/curriculum/releases) rather than forking or cloning our repository.

Run `git status` to ensure there are no undesirable changes.
Then run the following in your command line from the `curriculum` folder to commit your progress.

```
$ git add .
$ git commit -m "finish Blog: Comments exercise"
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
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="https://github.com/DockYard-Academy/curriculum/issues/new?assignees=&labels=&template=issue.md&title=Blog: Comments">Report An Issue</a>
</div>
<div style="display: flex;">
<i class="ri-arrow-left-fill"></i>
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="../reading/book_search_books.livemd">Book Search: Books</a>
</div>
<div style="display: flex;">
<a style="display: flex; color: #61758a; margin-right: 1rem;" href="../reading/book_search_seeding.livemd">BookSearch: Seeding</a>
<i class="ri-arrow-right-fill"></i>
</div>
</div>

