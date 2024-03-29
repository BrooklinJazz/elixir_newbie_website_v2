%{
  title: "Group Project: Blog"
}
---
# Group Project: Blog

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
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="https://github.com/DockYard-Academy/curriculum/issues/new?assignees=&labels=&template=issue.md&title=Group Project: Blog">Report An Issue</a>
</div>
<div style="display: flex;">
<i class="ri-arrow-left-fill"></i>
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="../exercises/phoenix_drills.livemd">Phoenix Drills</a>
</div>
<div style="display: flex;">
<a style="display: flex; color: #61758a; margin-right: 1rem;" href="../reading/rdbms.livemd">Relational Database Management Systems</a>
<i class="ri-arrow-right-fill"></i>
</div>
</div>

## Group Project: Blog

You're going to build a `Blog` application with a group of 3-4 others to learn more about Phoenix and Ecto.

As we move through the Phoenix and Web Development section, you'll gradually add more features to your blog.

## Overview

As you progress through the course, you will be prompted to complete additional features for your blog. We've going to give you a brief overview of the overall domain and the features you're going to build.

Your blog project should have three main domain concepts. `Users`, `Posts`, `Comments` and `Tags`.

* Users have many Posts
* Posts have many comments
* Posts have a many-to-many relationship with Tags.

```mermaid
flowchart
Users --have many--> Posts
Posts --have many--> Comments
Posts <--many to many--> Tags
```

Users will be able to signup and manage their own blog posts that are associated with certain tags such as `tech` and `education`. They will also be able to view other user's blogs and comment on them.

## Project Lead

One person in your group will be the project lead. The project lead will be responsible for reviewing/merging PRs and ensuring that the project is tested and runs smoothly.

## Initialize Group Project

Have the project lead use `phx.new` to create a new `blog` project.

```
$ mix phx.new blog
```

Initialize the project with git.

```
$ git init
```

[Create a GitHub Repository](https://github.com/new) and invite everyone as contributors to the project.

## Create Your README

Edit the `README.md` file initialized in your Phoenix project.

Include alteast the following information:

* Project Name
* Project Summary
* Technologies Used (Phoenix, Elixir)
* Contributors

You may update your README as the project expands

## Protect Main

[Project your main branch](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/defining-the-mergeability-of-pull-requests/managing-a-branch-protection-rule) so that no one can push directly to main without a PR review.

This is a common safety mechanism used on most projects to ensure no one can accidentally write to the main branch without review by another member of the project.

## Install Tailwind

Follow the [Phoenix + Tailwind Installation Guide](https://tailwindcss.com/docs/guides/phoenix) to add tailwind to your project.

Your team will be responsible for styling your project as you develop features. There will be no strict requirements for styling, and you are open to style your project as you like.

## Requirements

Here is a brief summary of the project requirements:

* As a user, I can create, update, and delete my own posts.
* As a user, I can search for and view other users posts that are published and set to visible.
* As a user, I can visit the page for each post to see the post's information and content.
* As a user, I can comment and see comments on other users posts.
* As a user, I can associate tags with a post.

You will be provided further requirements and instruction in the following upcoming exercises:

* [Blog: Posts](blog_posts.livemd)
* [Blog: Search](blog_search.livemd)
* [Blog: Visibility Migration](blog_migration.livemd)
* [Blog: Comments](blog_comments.livemd)
* [Blog: Seeding](blog_seeding.livemd)
* [Blog: Comment Form](blog_comment_form.livemd)
* [Blog: Authentication](blog_authentication.livemd)
* [Blog: Tags](blog_tags.livemd)
* [Blog: Blog Content](blog_content.livemd)
* [Project Deployment](deployment.livemd)

You will complete the above exercises as we progress through the course. While you should still complete exercises in order, your group is welcome to progress ahead of the established pace of the course. You may also go beyond the requirements if you would like. There will also be bonus features as seen in each individual exercise.

## Commit Your Progress

DockYard Academy now recommends you use the latest [Release](https://github.com/DockYard-Academy/curriculum/releases) rather than forking or cloning our repository.

Run `git status` to ensure there are no undesirable changes.
Then run the following in your command line from the `curriculum` folder to commit your progress.

```
$ git add .
$ git commit -m "finish Group Project: Blog exercise"
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
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="https://github.com/DockYard-Academy/curriculum/issues/new?assignees=&labels=&template=issue.md&title=Group Project: Blog">Report An Issue</a>
</div>
<div style="display: flex;">
<i class="ri-arrow-left-fill"></i>
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="../exercises/phoenix_drills.livemd">Phoenix Drills</a>
</div>
<div style="display: flex;">
<a style="display: flex; color: #61758a; margin-right: 1rem;" href="../reading/rdbms.livemd">Relational Database Management Systems</a>
<i class="ri-arrow-right-fill"></i>
</div>
</div>

