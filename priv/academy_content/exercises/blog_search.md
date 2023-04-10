%{
  title: "Blog: Search"
}
---
# Blog: Search

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
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="https://github.com/DockYard-Academy/curriculum/issues/new?assignees=&labels=&template=issue.md&title=Blog: Search">Report An Issue</a>
</div>
<div style="display: flex;">
<i class="ri-arrow-left-fill"></i>
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="../reading/book_search_authors.livemd">BookSearch: Authors</a>
</div>
<div style="display: flex;">
<a style="display: flex; color: #61758a; margin-right: 1rem;" href="../reading/schemas_and_migrations.livemd">Schemas And Migrations</a>
<i class="ri-arrow-right-fill"></i>
</div>
</div>

## Blog: Search

You're going to add the ability to search for blog posts to your `Blog` project.

The UI should look similar to the following, but does not have to match exactly as long as it has the required search functionality.

<!-- livebook:{"break_markdown":true} -->

![](images/blog_post_search_mock.png)

<!-- livebook:{"break_markdown":true} -->

The blog page should have a text input and a search button that directs the user to http://localhost:4000/posts?title=input_string
where `search_string` is the text inside of the form.

http://localhost:4000/posts?title=input_string should only display blogs whose title includes the `search_string` (case-insensitive).

<!-- livebook:{"break_markdown":true} -->

### Posts Context

The Posts context should be able to search for blog posts by their title.
The exact interface depends on how you have implemented posts. You might consider something like the following.

<!-- livebook:{"force_markdown":true} -->

```elixir
Posts.list_posts(title: "My Title")
```

Which would return a list of blog structs that include the search string in their title (case insensitive).

<!-- livebook:{"force_markdown":true} -->

```elixir
[
  %Post{id: 1, title: "My Title", content: "My Example Content"},
  %Post{id: 3, title: "my title", content: "My Example Content"}
  %Post{id: 3, title: "MY TITLE", content: "My Example Content"}
]
```

Filter out posts that do not include the searched text in their title.
posts that include the text should be found.

Consider including the following test cases.

* Find posts that exactly match search. (`"My Title"` matches `"My Title"`)
* Find posts that partially match search. (`"My Title"` matches `"This Includes My Title In It"`)
* Find posts that match search lower case insensitive. (`"My Title"` matches `"my title"`)
* Find posts that match search capital case insensitive. (`"My Title"` matches `"MY TITLE"`)
* Do not find posts that do not match search. (`"My Title"` does not match `"Non-matching Title"`)

<!-- livebook:{"break_markdown":true} -->

### Posts Controller

The posts controller should already display all posts when the client visits http://localhost:4000/posts.

On the same page that lists all posts, create a form with a text input and a submit button that triggers a GET request to http://localhost:4000/posts?title=search_string where `search_string` is the value of the text input.

The blog controller should filter the list of blogs by the `title` query parameter when the client visits http://localhost:4000/posts?title=search_string.

Consider including the following test cases.

* Visit http://localhost:4000/posts and trigger form input with the title "MyTitle". Assert the client is redirected to http://localhost:4000/posts?title=MyTitle.
* Visit http://localhost:4000/posts?title=MyTitle and find matching blogs.

## Further Reading

Consider the following resource(s) to deepen your understanding of the topic.

* [Phoenix: Introduction to Testing](https://hexdocs.pm/phoenix/testing.html)
* [Phoenix.ConnTest](https://hexdocs.pm/phoenix/Phoenix.ConnTest.html)

For a deep-dive into testing, we highly recommend the excellent book [Testing Elixir: Effective and Robust Testing for Elixir and its Ecosystem](https://pragprog.com/titles/lmelixir/testing-elixir/).

## Commit Your Progress

DockYard Academy now recommends you use the latest [Release](https://github.com/DockYard-Academy/curriculum/releases) rather than forking or cloning our repository.

Run `git status` to ensure there are no undesirable changes.
Then run the following in your command line from the `curriculum` folder to commit your progress.

```
$ git add .
$ git commit -m "finish Blog: Search exercise"
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
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="https://github.com/DockYard-Academy/curriculum/issues/new?assignees=&labels=&template=issue.md&title=Blog: Search">Report An Issue</a>
</div>
<div style="display: flex;">
<i class="ri-arrow-left-fill"></i>
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="../reading/book_search_authors.livemd">BookSearch: Authors</a>
</div>
<div style="display: flex;">
<a style="display: flex; color: #61758a; margin-right: 1rem;" href="../reading/schemas_and_migrations.livemd">Schemas And Migrations</a>
<i class="ri-arrow-right-fill"></i>
</div>
</div>

