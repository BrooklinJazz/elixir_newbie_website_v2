defmodule ElixirNewbie.AcademyContent.Lesson do
  @enforce_keys [:id, :title, :body, :type]
  defstruct [:id, :title, :body, :type]

  def build(file_name, attrs, body) do
    type = Regex.run(~r/reading|exercises/, file_name) |> hd() |> String.to_atom()

    struct!(__MODULE__, [id: Path.basename(file_name, ".md"), body: body, type: type] ++ Map.to_list(attrs))
  end
end
