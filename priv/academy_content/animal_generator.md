%{
  title: "Animal Generator"
}
---
# Animal Generator

```elixir
Mix.install([
  {:kino, "~> 0.7.0", override: true},
  {:youtube, github: "brooklinjazz/youtube"},
  {:hidden_cell, github: "brooklinjazz/hidden_cell"}
])
```

## Navigation

[Return Home](../start.livemd)<span style="padding: 0 30px"></span>
[Report An Issue](https://github.com/DockYard-Academy/beta_curriculum/issues/new?assignees=&labels=&template=issue.md&title=)

## Animal Generator

Often we need to create large amounts of fake data in order to test our applications. To simulate this experience, you're going to build data for an animal simulator game.

Each animal will be represented with a map. Each map should have the keys `name`, `animal_type`, and `age`.

Use the following names, species, and age ranges to generate your animal data. You may alter this to suite your own creative preferences!

<!-- livebook:{"force_markdown":true} -->

```elixir
names = ["Clifford", "Zoboomafoo", "Leonardo"]
animal_types = ["dog", "lemur", "turtle"]
ages = 1..14
```

Your list of animals should include every permutation of names, species, and ages. There are `126` permutations in the data examples above.

<details style="background-color: burlywood; padding: 1rem; margin: 1rem 0;">
<summary>Hint</summary>

Consider using `names`, `animal_types`, and `ages` as generators for a comprehension.

</details>

<details style="background-color: lightgreen; padding: 1rem; margin: 1rem 0;">
<summary>Example Solution</summary>

```elixir
names = ["Clifford", "Zoboomafoo", "Leonardo"]
animal_types = ["dog", "lemur", "turtle"]
ages = 1..14

for name <- names, animal_type <- animal_types, age <- ages do
  %{name: name, animal_type: animal_type, age: age}
end 
```

</details>

Enter your solution below.

```elixir

```

## Commit Your Progress

Run the following in your command line from the curriculum folder to track and save your progress in a Git commit.
Ensure that you do not already have undesired or unrelated changes by running `git status` or by checking the source control tab in Visual Studio Code.

```
$ git checkout main
$ git checkout -b exercise-animal_generator
$ git add .
$ git commit -m "finish animal generator exercise"
$ git push origin exercise-animal_generator
```

Create a pull request to your forked `main` branch. Please do not create a pull request to the DockYard Academy repository as this will spam our PR tracker.

**DockYard Academy Students Only:**

Notify your teacher by including `@BrooklinJazz` in your PR description to get feedback.

If you are interested in joining the next academy cohort, [sign up here](https://academy.dockyard.com/) to receive more news when it is available.

## Up Next

| Previous                               | Next                                           |
| -------------------------------------- | ---------------------------------------------: |
| [Anagram](../exercises/anagram.livemd) | [Book Search](../exercises/book_search.livemd) |
