defmodule ElixirNewbie.AcademyContent do
  alias ElixirNewbie.AcademyContent.Lesson

  use NimblePublisher,
    build: Lesson,
    from: Application.app_dir(:elixir_newbie, "priv/academy_content/*/*.md"),
    as: :lessons,
    highlighters: [:makeup_elixir]

  # And finally export them
  def all_lessons, do: @lessons

  def get_lesson(id, type) do
    Enum.find(all_lessons(), fn lesson -> lesson.id == id and lesson.type == type end)
  end
end
