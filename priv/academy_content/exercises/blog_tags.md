%{
  title: "Blog: Tags"
}
---
# Blog: Tags

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
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="https://github.com/DockYard-Academy/curriculum/issues/new?assignees=&labels=&template=issue.md&title=Blog: Tags">Report An Issue</a>
</div>
<div style="display: flex;">
<i class="ri-arrow-left-fill"></i>
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="../reading/book_search_tags.livemd">Book Search: Tags</a>
</div>
<div style="display: flex;">
<a style="display: flex; color: #61758a; margin-right: 1rem;" href="../reading/book_search_book_content.livemd">Book Search: Book Content</a>
<i class="ri-arrow-right-fill"></i>
</div>
</div>

## Blog Tags

You're going to add `Tags` to your existing [Blog](group_project_blog.livemd) project.

Each blog post has a many-to-many association with tags.

Tags should have `:name` field describing the type of tag such as `"tutorial"`, `"elixir"`, `"testing"`, etc.

```mermaid
classDiagram
  class Tag {
    name: :string
  }
```

Blogs and tags should be associated through a **join** table `blog_tags`.

```mermaid
classDiagram
  class BlogTag {
    blog_id: :id
    tag_id: :id
  }
```

<!-- livebook:{"break_markdown":true} -->

### Tag Requirements

Ensure you:

* Can perform standard CRUD operations for tags.
* Can associate a blog with a tag using a multiple select when you create or update a blog.
* Include a list of a blog's tags on the blog show page.

## Bonus: Search By Tag

Add the ability to see posts for a particular tag.

For example, you might include a show blogs by tag page which displays all blogs that belong to a specified tag on the `"/blogs/tags/:id` route where `:id` is the id of a tag.

Alternatively, you might create a form on the book index page to search for blogs by tag.

## Commit Your Progress

DockYard Academy now recommends you use the latest [Release](https://github.com/DockYard-Academy/curriculum/releases) rather than forking or cloning our repository.

Run `git status` to ensure there are no undesirable changes.
Then run the following in your command line from the `curriculum` folder to commit your progress.

```
$ git add .
$ git commit -m "finish Blog: Tags exercise"
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
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="https://github.com/DockYard-Academy/curriculum/issues/new?assignees=&labels=&template=issue.md&title=Blog: Tags">Report An Issue</a>
</div>
<div style="display: flex;">
<i class="ri-arrow-left-fill"></i>
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="../reading/book_search_tags.livemd">Book Search: Tags</a>
</div>
<div style="display: flex;">
<a style="display: flex; color: #61758a; margin-right: 1rem;" href="../reading/book_search_book_content.livemd">Book Search: Book Content</a>
<i class="ri-arrow-right-fill"></i>
</div>
</div>

