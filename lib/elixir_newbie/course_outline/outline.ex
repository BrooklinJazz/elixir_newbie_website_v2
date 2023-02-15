defmodule ElixirNewbie.CourseOutline.Outline do
  @enforce_keys [:body]
  defstruct [:body]

  def build(filename, attrs, body) do
    id = filename
    struct!(__MODULE__, [body: body])
  end
end
