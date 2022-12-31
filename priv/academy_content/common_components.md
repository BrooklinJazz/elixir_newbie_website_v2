%{
  title: "Common Components"
}
---
# Common Components

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

## Common Components

You're going to use HTML and CSS to replicate some styled components.

Create an `.html` document or use [CodePen](https://codepen.io/pen/) to create these components.

```html
<!doctype html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
    </style>
  </head>
  <body>
    <!-- Component goes here -->
  </body>
</html>
```

## Hoverable Outline Button

Replicate the following outlined button as closely as you can.

<!-- livebook:{"break_markdown":true} -->

![](images/outline-button.png)

<!-- livebook:{"break_markdown":true} -->

On hover, the button should change the `background-color`.

<!-- livebook:{"break_markdown":true} -->

![](images/outline-button-hover.png)

## Rainbow Boxes

Create a series of rainbow colored boxes like the following.

<details style="background-color: burlywood; padding: 1rem; margin: 1rem 0;">
<summary>Hint</summary>

Research `padding`, `margin`, `background-color`, and `border` and consider using nested elements.

</details>

<!-- livebook:{"break_markdown":true} -->

![](images/rainbow_component.png)

## Card Component

Components like the following are often called **Card Components**. Create a card component matching the following with an image, heading, subtitle, body, and bottom bar decoration.

You can use https://picsum.photos/200/100 to retrieve a fake image:

```html
<img src="https://picsum.photos/200/100"></img>
```

<details style="background-color: burlywood; padding: 1rem; margin: 1rem 0;">
<summary>Hint</summary>

You can create a rounded border using the `border-radius` and `border` declarations.

You can create a horizontal bar using either the `<hr></hr>` element, or an empty `div` element.

</details>

<!-- livebook:{"break_markdown":true} -->

![](images/card_component_light_mode.png)

## Commit Your Progress

Run the following in your command line from the curriculum folder to track and save your progress in a Git commit.
Ensure that you do not already have undesired or unrelated changes by running `git status` or by checking the source control tab in Visual Studio Code.

```
$ git checkout main
$ git checkout -b exercise-common_components
$ git add .
$ git commit -m "finish common components exercise"
$ git push origin exercise-common_components
```

Create a pull request to your forked `main` branch. Please do not create a pull request to the DockYard Academy repository as this will spam our PR tracker.

**DockYard Academy Students Only:**

Notify your teacher by including `@BrooklinJazz` in your PR description to get feedback.

If you are interested in joining the next academy cohort, [sign up here](https://academy.dockyard.com/) to receive more news when it is available.

## Up Next

| Previous                               | Next                                       |
| -------------------------------------- | -----------------------------------------: |
| [HTML CSS](../reading/html_css.livemd) | [Home Page](../exercises/home_page.livemd) |

