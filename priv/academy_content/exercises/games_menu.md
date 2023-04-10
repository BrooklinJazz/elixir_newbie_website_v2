%{
  title: "Games: Menu"
}
---
# Games: Menu

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
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="https://github.com/DockYard-Academy/curriculum/issues/new?assignees=&labels=&template=issue.md&title=Games: Menu">Report An Issue</a>
</div>
<div style="display: flex;">
<i class="ri-arrow-left-fill"></i>
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="../reading/executables.livemd">Executables</a>
</div>
<div style="display: flex;">
<a style="display: flex; color: #61758a; margin-right: 1rem;" href="../reading/advanced_pattern_matching.livemd">Advanced Pattern Matching</a>
<i class="ri-arrow-right-fill"></i>
</div>
</div>

## Games: Menu

In your existing [Games](./games_setup.livemd) project, you're going to create a `Games.Menu` module which allows players to select which game they would like to play.

```
$ iex -S mix
iex> Games.Menu.display()
Select a game:
1. Guessing Game
2. Rock Paper Scissors
3. Wordle
Select: 
```

Depending on their choice, this let the player play either the [Guessing Game](games_guessing_game.livemd), [Rock Paper Scissors](./games_rock_paper_scissors.livemd),
or  [Wordle](games_wordle.livemd) games you have already created.

```
Select a game:
1. Guessing Game
2. Rock Paper Scissors
3. Wordle
Select: 3
Enter a five letter word:  
```

## Games: Escript

Configure your game as an Escript. You'll need to create a `Games.CLI` module with a `main/1` function to display the `Games.Menu`.

<!-- livebook:{"force_markdown":true} -->

```elixir
defmodule Games.CLI do
  def main(args) do
    Games.Menu.display()
  end
end
```

And configure the `Games.CLI` module using the `:escript` option inside of the `Games.MixProject.project/0` function.

<!-- livebook:{"force_markdown":true} -->

```elixir
  def project do
    [
      ...
      escript: [main_module: Games.CLI]
    ]
  end
```

You should be able to build and start the games project as an escript.

```
$ mix escript.build
$ ./games
Select a game:
1. Guessing Game
2. Rock Paper Scissors
3. Wordle
Select: 
```

## Bonus: Finish Game

Allow the user to type `"stop"` to end any game. They should then be re-prompted with the menu to select the game they want to play.

```
Select a game:
1. Guessing Game
2. Rock Paper Scissors
3. Wordle
Select: 1
Enter your guess:
stop
Select a game:
1. Guessing Game
2. Rock Paper Scissors
3. Wordle
Select: 
```

This may require custom stop logic in each existing game.

## Commit Your Progress

DockYard Academy now recommends you use the latest [Release](https://github.com/DockYard-Academy/curriculum/releases) rather than forking or cloning our repository.

Run `git status` to ensure there are no undesirable changes.
Then run the following in your command line from the `curriculum` folder to commit your progress.

```
$ git add .
$ git commit -m "finish Games: Menu exercise"
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
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="https://github.com/DockYard-Academy/curriculum/issues/new?assignees=&labels=&template=issue.md&title=Games: Menu">Report An Issue</a>
</div>
<div style="display: flex;">
<i class="ri-arrow-left-fill"></i>
<a style="display: flex; color: #61758a; margin-left: 1rem;" href="../reading/executables.livemd">Executables</a>
</div>
<div style="display: flex;">
<a style="display: flex; color: #61758a; margin-right: 1rem;" href="../reading/advanced_pattern_matching.livemd">Advanced Pattern Matching</a>
<i class="ri-arrow-right-fill"></i>
</div>
</div>

