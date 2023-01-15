%{
  title: "Blog: Search"
}
---
# Blog: Search

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

## Blog: Search

You're going to add the ability to search for blog posts to your `Blog` project.

See the [DockYard Academy: Blog/search](https://github.com/DockYard-Academy/blog/tree/search) branch of the demonstration project if you would like to see an example.

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
git commit -m "add posts search feature"
git push
```

## Bonus: Filter By Content

Filter your posts by both content and title. Include partial and case-insensitive matches.

<!-- livebook:{"force_markdown":true} -->

```elixir
Posts.list_all(title: "My Title", content: "My Content")
```

Ensure you test both the context, and the controller similar to how you did with title. In addition, ensure you test that you can filter by both content and title at the same time.

## Further Reading

Consider the following resource(s) to deepen your understanding of the topic.

* [Phoenix: Introduction to Testing](https://hexdocs.pm/phoenix/testing.html)
* [Phoenix.ConnTest](https://hexdocs.pm/phoenix/Phoenix.ConnTest.html)

For a deep-dive into testing, we highly recommend the excellent book [Testing Elixir: Effective and Robust Testing for Elixir and its Ecosystem](https://pragprog.com/titles/lmelixir/testing-elixir/).

## Commit Your Progress

Run the following in your command line from the curriculum folder to track and save your progress in a Git commit.
Ensure that you do not already have undesired or unrelated changes by running `git status` or by checking the source control tab in Visual Studio Code.

```
$ git checkout main
$ git checkout -b exercise-blog_search
$ git add .
$ git commit -m "finish blog search exercise"
$ git push origin exercise-blog_search
```

Create a pull request to your forked `main` branch. Please do not create a pull request to the DockYard Academy repository as this will spam our PR tracker.

**DockYard Academy Students Only:**

Notify your teacher by including `@BrooklinJazz` in your PR description to get feedback.

If you are interested in joining the next academy cohort, [sign up here](https://academy.dockyard.com/) to receive more news when it is available.

## Up Next

| Previous                                                     | Next                                                               |
| ------------------------------------------------------------ | -----------------------------------------------------------------: |
| [Book Search Authors](../reading/book_search_authors.livemd) | [Schemas And Migrations](../reading/schemas_and_migrations.livemd) |

