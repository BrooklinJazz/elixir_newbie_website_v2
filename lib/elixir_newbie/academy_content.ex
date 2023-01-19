defmodule ElixirNewbie.AcademyContent do
  alias ElixirNewbie.AcademyContent.Lesson

  use NimblePublisher,
    build: Lesson,
    from: Application.app_dir(:elixir_newbie, "priv/posts/*.md"),
    as: :lessons,
    highlighters: [:makeup_elixir]

  # And finally export them
  def all_lessons, do: @lessons
end
