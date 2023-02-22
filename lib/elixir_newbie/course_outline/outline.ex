defmodule ElixirNewbie.CourseOutline.Outline do
  @enforce_keys [:body]
  defstruct [:body]

  def build(_filename, _attrs, body) do
    struct!(__MODULE__, [body: body])
  end
end
