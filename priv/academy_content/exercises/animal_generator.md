%{
  title: "Animal Generator"
}
---
# Animal Generator

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
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="https://github.com/DockYard-Academy/curriculum/issues/new?assignees=&labels=&template=issue.md&title=Animal Generator">Report An Issue</a>
</div>
<div style="display: flex;">
<i class="ri-arrow-left-fill"></i>
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="../exercises/anagram.livemd">Anagram</a>
</div>
<div style="display: flex;">
<a style="display: flex; color: #61758a; margin-right: 1rem;" href="../exercises/book_search.livemd">Book Search</a>
<i class="ri-arrow-right-fill"></i>
</div>
</div>

## Animal Generator

Often we need to create large amounts of fake data in order to test our applications. To simulate this experience, you're going to build data for an animal simulator game.

Each animal will be represented with a map. Each map should have the keys `name`, `animal_type`, and `age`.

Use the following names, species, and age ranges to generate your animal data. You may alter this to suite your own creative preferences!

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

DockYard Academy now recommends you use the latest [Release](https://github.com/DockYard-Academy/curriculum/releases) rather than forking or cloning our repository.

Run `git status` to ensure there are no undesirable changes.
Then run the following in your command line from the `curriculum` folder to commit your progress.

```
$ git add .
$ git commit -m "finish Animal Generator exercise"
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
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="https://github.com/DockYard-Academy/curriculum/issues/new?assignees=&labels=&template=issue.md&title=Animal Generator">Report An Issue</a>
</div>
<div style="display: flex;">
<i class="ri-arrow-left-fill"></i>
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="../exercises/anagram.livemd">Anagram</a>
</div>
<div style="display: flex;">
<a style="display: flex; color: #61758a; margin-right: 1rem;" href="../exercises/book_search.livemd">Book Search</a>
<i class="ri-arrow-right-fill"></i>
</div>
</div>

