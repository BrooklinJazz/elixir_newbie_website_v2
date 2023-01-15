%{
  title: "Drills: SQL Queries"
}
---
# SQL Drills

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

## SQL Drills

Drills help you develop familiarity and muscle memory with syntax through repeated exercises. Unlike usual problems, Drills are not intended to develop problem solving skills, they are purely for developing comfort and speed.

This set of drills is for using SQL and PostgreSQL. Follow the instructions for each drill and complete them as quickly as you can.

To complete this exercise, you may need to switch to the `postgres` user from your command line.

```
$ sudo -i -u postgres
```

## PostgreSQL

From the command line, create a `drills` PostgreSQL Database.

<details style="background-color: lightgreen; padding: 1rem; margin: 1rem 0;">
<summary>Example Solution</summary>

```
createdb drills
```

</details>

<!-- livebook:{"break_markdown":true} -->

From the command line, open the PostgreSQL prompt.

<details style="background-color: lightgreen; padding: 1rem; margin: 1rem 0;">
<summary>Example Solution</summary>

```
psql
```

</details>

<!-- livebook:{"break_markdown":true} -->

From the PostgreSQL prompt, view your list of databases.

<details style="background-color: lightgreen; padding: 1rem; margin: 1rem 0;">
<summary>Example Solution</summary>

```
\l
```

</details>

<!-- livebook:{"break_markdown":true} -->

From the PostgreSQL prompt, connect to your `drills` database.

<details style="background-color: lightgreen; padding: 1rem; margin: 1rem 0;">
<summary>Example Solution</summary>

```
\c drills
```

</details>

## SQL

From your PostgreSQL prompt, create an `authors` table. `authors` should have an `ID` primary key field, and a `NAME` `VARCHAR` field.
Every fields should be `NOT NULL`.

<details style="background-color: lightgreen; padding: 1rem; margin: 1rem 0;">
<summary>Example Solution</summary>

```
CREATE TABLE authors (
   ID    INT              NOT NULL,
   NAME  VARCHAR (255)    NOT NULL,
   PRIMARY KEY (ID)
);
```

</details>

<!-- livebook:{"break_markdown":true} -->

From your PostgreSQL prompt, create a `books` table. `books` should have a `TITLE` field up to `30` characters, and a `CONTENT` field of unlimited length. Both fields should be `NOT NULL`.

`books` should also store an optional `AUTHORID` `FOREIGN KEY` field that `REFERENCES` the `authors` table by `ID`.

<details style="background-color: lightgreen; padding: 1rem; margin: 1rem 0;">
<summary>Example Solution</summary>

```
CREATE TABLE books (
    ID INT NOT NULL,
    TITLE VARCHAR(30) NOT NULL,
    CONTENT TEXT NOT NULL,
    AUTHORID INT,
    PRIMARY KEY (ID),
    FOREIGN KEY (AUTHORID) REFERENCES authors(ID)
);
```

</details>

<!-- livebook:{"break_markdown":true} -->

From the PostgreSQL prompt, view both of your tables.

<details style="background-color: lightgreen; padding: 1rem; margin: 1rem 0;">
<summary>Example Solution</summary>

```
\dt
```

</details>

<!-- livebook:{"break_markdown":true} -->

From the PostgreSQL prompt, create an author in the `authors` table.

<details style="background-color: lightgreen; padding: 1rem; margin: 1rem 0;">
<summary>Example Solution</summary>

```
INSERT INTO authors (ID,NAME) VALUES (1, 'Patrick Rothfuss');
```

</details>

<!-- livebook:{"break_markdown":true} -->

From the PostgreSQL prompt, create a book in the `books` table that belongs to the author you previously created.

<details style="background-color: lightgreen; padding: 1rem; margin: 1rem 0;">
<summary>Example Solution</summary>

```
INSERT INTO books (ID,TITLE,CONTENT,AUTHORID) VALUES (1, 'Name of the Wind', 'My name is Kvothe, pronounced nearly the same as quothe', 1);
```

</details>

<!-- livebook:{"break_markdown":true} -->

From the PostgreSQL prompt, select all authors.

<details style="background-color: lightgreen; padding: 1rem; margin: 1rem 0;">
<summary>Example Solution</summary>

```sql
SELECT * FROM authors;
```

</details>

<!-- livebook:{"break_markdown":true} -->

From the PostgreSQL prompt, select all books.

<details style="background-color: lightgreen; padding: 1rem; margin: 1rem 0;">
<summary>Example Solution</summary>

```
SELECT * FROM books
```

</details>

<!-- livebook:{"break_markdown":true} -->

From the PostgreSQL prompt, select all books that belong to the author you previously created.

<details style="background-color: lightgreen; padding: 1rem; margin: 1rem 0;">
<summary>Example Solution</summary>

```
SELECT * FROM books b WHERE b.authorid = 1
```

</details>

## Commit Your Progress

Run the following in your command line from the curriculum folder to track and save your progress in a Git commit.
Ensure that you do not already have undesired or unrelated changes by running `git status` or by checking the source control tab in Visual Studio Code.

```
$ git checkout main
$ git checkout -b exercise-sql_drills
$ git add .
$ git commit -m "finish sql drills exercise"
$ git push origin exercise-sql_drills
```

Create a pull request to your forked `main` branch. Please do not create a pull request to the DockYard Academy repository as this will spam our PR tracker.

**DockYard Academy Students Only:**

Notify your teacher by including `@BrooklinJazz` in your PR description to get feedback.

If you are interested in joining the next academy cohort, [sign up here](https://academy.dockyard.com/) to receive more news when it is available.

## Up Next

| Previous                                               | Next                                         |
| ------------------------------------------------------ | -------------------------------------------: |
| [Phoenix And Ecto](../reading/phoenix_and_ecto.livemd) | [Blog Posts](../exercises/blog_posts.livemd) |

