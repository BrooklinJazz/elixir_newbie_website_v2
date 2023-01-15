%{
  title: "Spoonacular Recipe API"
}
---
# Spoonacular Recipe API

```elixir
Mix.install([
  {:kino, "~> 0.7.0", override: true},
  {:youtube, github: "brooklinjazz/youtube"},
  {:hidden_cell, github: "brooklinjazz/hidden_cell"},
  {:httpoison, "~> 1.8"},
  {:poison, "~> 5.0"}
])
```

## Navigation

[Return Home](../start.livemd)<span style="padding: 0 30px"></span>
[Report An Issue](https://github.com/DockYard-Academy/beta_curriculum/issues/new?assignees=&labels=&template=issue.md&title=)

## Spoonacular Recipe API

[Spoonacular](https://spoonacular.com/) is a popular food API.

Create a free Spoonacular to get your API key. You can view your API key in the [Spoonacular Console](https://spoonacular.com/food-api/console#Dashboard).

### Browser Request

Use your API to visit the `https://api.spoonacular.com/recipes/complexSearch?apiKey=API_KEY` URL where API_KEY should be your API key from the console.

### HTTPoison Request

Use [HTTPoison](https://hexdocs.pm/httpoison/HTTPoison.html) to retrieve the same JSON data from the `https://api.spoonacular.com/recipes/complexSearch?apiKey=API_KEY` URL you visited in the browser. Then use [Poison](https://hexdocs.pm/poison/Poison.html) to decode the JSON response into an Elixir data structure.

```elixir

```

## Commit Your Progress

Run the following in your command line from the curriculum folder to track and save your progress in a Git commit.
Ensure that you do not already have undesired or unrelated changes by running `git status` or by checking the source control tab in Visual Studio Code.

```
$ git checkout main
$ git checkout -b exercise-spoonacular_recipe_api
$ git add .
$ git commit -m "finish spoonacular recipe api exercise"
$ git push origin exercise-spoonacular_recipe_api
```

Create a pull request to your forked `main` branch. Please do not create a pull request to the DockYard Academy repository as this will spam our PR tracker.

**DockYard Academy Students Only:**

Notify your teacher by including `@BrooklinJazz` in your PR description to get feedback.

If you are interested in joining the next academy cohort, [sign up here](https://academy.dockyard.com/) to receive more news when it is available.

## Up Next

| Previous                       | Next                                           |
| ------------------------------ | ---------------------------------------------: |
| [APIs](../reading/apis.livemd) | [Pokemon API](../exercises/pokemon_api.livemd) |
