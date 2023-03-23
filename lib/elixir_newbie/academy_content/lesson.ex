defmodule ElixirNewbie.AcademyContent.Lesson do
  @enforce_keys [:id, :title, :body, :type]
  defstruct [:id, :title, :body, :type]

  def build(file_name, attrs, body) do
    type = Regex.run(~r/reading|exercises/, file_name) |> hd() |> String.to_atom()

    formatted_body =
      body
      |> remove_livemd_extension()
      |> your_turn_sections(file_name)
      |> detail_sections()

    struct!(
      __MODULE__,
      [id: Path.basename(file_name, ".md"), body: formatted_body, type: type] ++
        Map.to_list(attrs)
    )
  end

  # Remove .livemd from local links. E.g. ../whatever.livemd -> ../whatever
  # External links are kept. E.g. https://github.com/a/b/whatever.livemd is not replaced
  defp remove_livemd_extension(text) do
    String.replace(text, ~r/(\.\..+)\.livemd/, "\\g{1}", global: true)
  end

  defp your_turn_sections(text, file_name) do
    [_full, file_path, _] = Regex.run(~r/((reading|exercises).*)\.md/, file_name)
    dya_url = "https://github.com/DockYard-Academy/curriculum/blob/main/#{file_path}.livemd"
    url = "https://livebook.dev/run?url=#{URI.encode(dya_url)}"

    Regex.replace(~r/\<pre\>\<code class=\"makeup elixir\"\>\<\/code\>\<\/pre\>/, text, fn full ->
      "<a href=\"#{url}\" class=\"your_turn\">Use Livebook to enter solutions.</a>"
    end)
  end

  defp detail_sections(text) do
    Regex.replace(~r/```elixir\n((.|\n)*)```/U, text, fn _full, code ->
      Makeup.highlight(code)
    end)
  end
end
