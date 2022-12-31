defmodule ElixirNewbie.AcademyContent.Lesson do
  @enforce_keys [:id, :title, :body]
  defstruct [:id, :title, :body]

  def build(filename, attrs, body) do
    id = filename
    struct!(__MODULE__, [id: id, body: body] ++ Map.to_list(attrs))
  end
end
