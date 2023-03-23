defmodule ElixirNewbie.AcademyContent.Lesson do
  @enforce_keys [:id, :title, :body, :type]
  defstruct [:id, :title, :body, :type]

  def build(file_name, attrs, body) do
    keys = [
      id: Path.basename(file_name, ".md"),
      body: format_body(body, file_name),
      type: get_type(file_name)
    ]

    struct!(__MODULE__, keys ++ Map.to_list(attrs))
  end

  def get_type(file_name) do
    case Regex.run(~r/reading|exercises/, file_name) do
      ["reading"] -> :reading
      ["exercises"] -> :exercise
    end
  end

  def format_body(body, file_name) do
    body
    |> remove_livemd_extension()
    |> latex_expressions()
    |> your_turn_sections(file_name)
    |> detail_sections()
  end

  # Remove .livemd from local links. E.g. ../whatever.livemd -> ../whatever
  # External links are kept. E.g. https://github.com/a/b/whatever.livemd is not replaced
  defp remove_livemd_extension(text) do
    String.replace(text, ~r/(\.\..+)\.livemd/, "\\g{1}", global: true)
  end

  defp latex_expressions(text) do
    Regex.replace(~r/\$(.|\n)*\$/U, text, fn full ->
      """
      <latex-js>
        #{full}
      </latex-js>
      """
    end)
  end

  defp your_turn_sections(text, file_name) do
    [_full, file_path, _] = Regex.run(~r/((reading|exercises).*)\.md/, file_name)
    dya_url = "https://github.com/DockYard-Academy/curriculum/blob/main/#{file_path}.livemd"
    url = "https://livebook.dev/run?url=#{URI.encode(dya_url)}"

    Regex.replace(
      ~r/\<pre\>\<code class=\"makeup elixir\"\>\<\/code\>\<\/pre\>/,
      text,
      "<a href=\"#{url}\" class=\"your_turn\">Use Livebook to enter solutions.</a>"
    )
  end

  defp detail_sections(text) do
    Regex.replace(~r/```elixir\n((.|\n)*)```/U, text, fn _full, code ->
      Makeup.highlight(code)
    end)
  end
end
