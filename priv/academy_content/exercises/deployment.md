%{
  title: "Project Deployment"
}
---
# Deployment

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
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="https://github.com/DockYard-Academy/curriculum/issues/new?assignees=&labels=&template=issue.md&title=Deployment">Report An Issue</a>
</div>
<div style="display: flex;">
<i class="ri-arrow-left-fill"></i>
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="../reading/book_search_deployment.livemd">Book Search: Deployment</a>
</div>
<div style="display: flex;">
<a style="display: flex; color: #61758a; margin-right: 1rem;" href="../exercises/group_project_blog_presentation.livemd">Group Project: Presentation</a>
<i class="ri-arrow-right-fill"></i>
</div>
</div>

## Deploy

Use [Fly.io](https://fly.io/) to deploy your [Blog](group_project_blog.livemd) or capstone project.

<div style="background-color: lightcoral; font-weight: bold; padding: 1rem; color: black; margin: 1rem 0;">
At the time of writing, Fly.io allows you to have two free apps. If you choose to deploy your Blog project, then you may have to pay a fee to deploy your capstone project.
</div>

<!-- livebook:{"break_markdown":true} -->

### Setup Continuous Integration

Use GitHub Actions to setup a CI system that will automatically run tests whenever you make a PR to the `Blog` project.

<!-- livebook:{"break_markdown":true} -->

### Setup Continuous Deployment System

Use GitHub Actions to setup a CD system with Fly.io that will automatically deploy your project whenever you merge a PR to the `main` branch.

<!-- livebook:{"break_markdown":true} -->

### Bonus: Production Seeds

Create a module that will seed your production database with data. Open the IEx shell in your production application and use the module to seed your production database.

<!-- livebook:{"break_markdown":true} -->

### Bonus: CI Check

Add the following steps to your CI process.

Code formatting:

```
Run mix format --check-formatted
```

Check warnings as errors:

```
mix compile --warnings-as-errors
```

<!-- livebook:{"break_markdown":true} -->

### Bonus: Credo CI

Add [Credo](../reading/credo.livemd) to your project and configure it with your continuous integration system.

<!-- livebook:{"break_markdown":true} -->

### Bonus: Dialyzer CI

Add [Dialyzer](../reading/typespecs.livemd) to your project and configure it with your continuous integration system.

## Commit Your Progress

DockYard Academy now recommends you use the latest [Release](https://github.com/DockYard-Academy/curriculum/releases) rather than forking or cloning our repository.

Run `git status` to ensure there are no undesirable changes.
Then run the following in your command line from the `curriculum` folder to commit your progress.

```
$ git add .
$ git commit -m "finish Deployment exercise"
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
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="https://github.com/DockYard-Academy/curriculum/issues/new?assignees=&labels=&template=issue.md&title=Deployment">Report An Issue</a>
</div>
<div style="display: flex;">
<i class="ri-arrow-left-fill"></i>
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="../reading/book_search_deployment.livemd">Book Search: Deployment</a>
</div>
<div style="display: flex;">
<a style="display: flex; color: #61758a; margin-right: 1rem;" href="../exercises/group_project_blog_presentation.livemd">Group Project: Presentation</a>
<i class="ri-arrow-right-fill"></i>
</div>
</div>

