%{
  title: "Tailwind CSS Components"
}
---
# Tailwind Components

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

## Tailwind Components

You're going to use [Tailwind CSS](https://tailwindcss.com/docs/installation) and HTML to mimic a provided image. Create a new HTML file in your projects folder for each exercise.

```html
<!doctype html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
  <h1 class="text-3xl font-bold underline">
    Hello world!
  </h1>
</body>
</html>
```

## Hoverable Outline Button

Create a button with rounder corners, an underline, the `orange-500` background and `3xl` size text.

<!-- livebook:{"break_markdown":true} -->

![](images/outline-button.png)

<!-- livebook:{"break_markdown":true} -->

On hover, the button should change the background color to `orange-500`.

<!-- livebook:{"break_markdown":true} -->

![](images/outline-button-hover.png)

<!-- livebook:{"break_markdown":true} -->

### Sign Up Form

Create the following Sign Up form.

You can find an example solution here: https://play.tailwindcss.com/fghjDPOp7Y

<!-- livebook:{"break_markdown":true} -->

![](images/tailwind_components_signup_form.png)

## Rainbow Boxes

Create a series of rainbow colored boxes like the following.

<!-- livebook:{"break_markdown":true} -->

![](images/rainbow_component.png)

## Card Component

Components like the following are often called **Card Components**. Create a card component matching the following with an image, heading, subtitle, body, and bottom bar decoration.

You can use https://picsum.photos/200/100 to retrieve a fake image:

```html
<img src="https://picsum.photos/200/100"></img>
```

<!-- livebook:{"break_markdown":true} -->

![](images/card_component_light_mode.png)

<!-- livebook:{"break_markdown":true} -->

### Bonus: Clone Component

Front-end developers who focus on building UI often work together with Designers to build out an existing design. While you might not have access to your own designer, you can mimic this experience for further practice.

Go to one of your favourite websites and pick an element on the page. Recreate the element using HTML + Tailwind. You may even create an entire "clone" of the page to really stretch your skills.

## Commit Your Progress

Run the following in your command line from the curriculum folder to track and save your progress in a Git commit.
Ensure that you do not already have undesired or unrelated changes by running `git status` or by checking the source control tab in Visual Studio Code.

```
$ git checkout main
$ git checkout -b exercise-tailwind_css_components
$ git add .
$ git commit -m "finish tailwind css components exercise"
$ git push origin exercise-tailwind_css_components
```

Create a pull request to your forked `main` branch. Please do not create a pull request to the DockYard Academy repository as this will spam our PR tracker.

**DockYard Academy Students Only:**

Notify your teacher by including `@BrooklinJazz` in your PR description to get feedback.

If you are interested in joining the next academy cohort, [sign up here](https://academy.dockyard.com/) to receive more news when it is available.

## Up Next

| Previous                               | Next                                       |
| -------------------------------------- | -----------------------------------------: |
| [Tailwind](../reading/tailwind.livemd) | [Portfolio](../exercises/portfolio.livemd) |

