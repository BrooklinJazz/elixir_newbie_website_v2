defmodule ElixirNewbie.AcademyContent.Lesson do
  @enforce_keys [:id, :title, :body, :type]
  defstruct [:id, :title, :body, :type]

  def build(file_name, attrs, body) do
    type = Regex.run(~r/reading|exercises/, file_name) |> hd() |> String.to_atom()

    body = remove_livemd_extension(body) |> code_blocks_inside_details()

    struct!(
      __MODULE__,
      [id: Path.basename(file_name, ".md"), body: body, type: type] ++ Map.to_list(attrs)
    )
  end

  # Remove .livemd from local links. E.g. ../whatever.livemd -> ../whatever
  # External links are kept. E.g. https://github.com/a/b/whatever.livemd is not replaced
  defp remove_livemd_extension(text) do
    String.replace(text, ~r/(\.\..+)\.livemd/, "\\g{1}", global: true)
  end

  defp code_blocks_inside_details(text) do
    Regex.replace(~r/```elixir\n((.|\n)*)```/U, text, fn _full, code ->
    Makeup.highlight(code)
    end)
  end
end
