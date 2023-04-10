%{
  title: "GitHub Engineering Journal"
}
---
# Github Engineering Journal

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
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="https://github.com/DockYard-Academy/curriculum/issues/new?assignees=&labels=&template=issue.md&title=Github Engineering Journal">Report An Issue</a>
</div>
<div style="display: flex;">
<i class="ri-arrow-left-fill"></i>
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="../exercises/command_line_family_tree.livemd">Command Line Family Tree</a>
</div>
<div style="display: flex;">
<a style="display: flex; color: #61758a; margin-right: 1rem;" href="../exercises/github_collab.livemd">Github Collab</a>
<i class="ri-arrow-right-fill"></i>
</div>
</div>

## Engineering Journal

It's genuinely a great habit to keep an engineering journal.
You can use your engineering journal to track how you solve problems and what your work on.
It's also excellent practice with Git, GitHub, and markdown.

You may use any method (such as GitHub Desktop, or the command line) to accomplish the following.

In this exercise

* create a local git project called `engineering_journal`.
* create your first journal entry as a `.md` file. Name the file after a topic, or todays date. i.e. `2022-03-28.md`.
* stage and commit the journal entry.
* create a remote repository for `engineering_journal`.
* push your changes to the remote repository.

Once finished, we highly recommend you use this as an engineering journal to track things you learn about Elixir.

<!-- livebook:{"break_markdown":true} -->

### Bonus: Foam

You may also be interested in the [Foam](https://foambubble.github.io/foam/) project for Visual Studio Code. Foam provides useful features such as hyperlinks and a graph visualization of all your notes.

Follow the [Foam Getting Started Guide](https://foambubble.github.io/foam/#getting-started) and install the [Recommended Extensions](https://foambubble.github.io/foam/user/getting-started/recommended-extensions).

Create a new foam note, and include a hyperlink. Run the `Foam: Show graph` command to see a graph of your notes that have hyperlinks to each other.

<!-- livebook:{"break_markdown":true} -->

![](images/graph.png)

<!-- livebook:{"break_markdown":true} -->

Foam makes for an even better engineering journal, because you can create notes for specific topics, and create hyperlinks between notes to store everything you learn about that topic.

It's also excellent practice for learning Markdown.

## Commit Your Progress

DockYard Academy now recommends you use the latest [Release](https://github.com/DockYard-Academy/curriculum/releases) rather than forking or cloning our repository.

Run `git status` to ensure there are no undesirable changes.
Then run the following in your command line from the `curriculum` folder to commit your progress.

```
$ git add .
$ git commit -m "finish Github Engineering Journal exercise"
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
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="https://github.com/DockYard-Academy/curriculum/issues/new?assignees=&labels=&template=issue.md&title=Github Engineering Journal">Report An Issue</a>
</div>
<div style="display: flex;">
<i class="ri-arrow-left-fill"></i>
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="../exercises/command_line_family_tree.livemd">Command Line Family Tree</a>
</div>
<div style="display: flex;">
<a style="display: flex; color: #61758a; margin-right: 1rem;" href="../exercises/github_collab.livemd">Github Collab</a>
<i class="ri-arrow-right-fill"></i>
</div>
</div>

