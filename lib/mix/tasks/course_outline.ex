defmodule Mix.Tasks.CourseOutline do
  @moduledoc "The hello mix task: `mix help hello`"
  @shortdoc @moduledoc

  use Mix.Task

  @impl true
  def run(_) do
    IO.puts("running: Course Outline")
    Mix.Task.run("app.start")

    url = "https://raw.githubusercontent.com/DockYard-Academy/beta_curriculum/main/start.livemd"

    {:ok, %HTTPoison.Response{body: body}} = HTTPoison.get(url)

    outline =
      Regex.replace(~r/\[([^\]]+)\]\(([^\)]+\.livemd)\)/, body, fn _, file_name, file_path ->
        "[#{file_name}](#{Path.rootname(file_path)})"
      end)

    content = """
    %{
      title: "Hello start table of contents",
    }
    ---
    #{outline}
    """

    File.write("priv/course_outline.md", content)
  end
end
