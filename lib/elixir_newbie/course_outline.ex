defmodule ElixirNewbie.CourseOutline do
  alias ElixirNewbie.CourseOutline.Outline

  use NimblePublisher,
    build: Outline,
    from: Application.app_dir(:elixir_newbie, "priv/course_outline.md"),
    as: :outline,
    highlighters: [:makeup_elixir]

  # And finally export them
  def outline, do: List.first(@outline)
end
