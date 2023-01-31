defmodule Mix.Tasks.CourseOutline do
  @moduledoc "The hello mix task: `mix help hello`"
  use Mix.Task

  # @shortdoc "Simply calls the Hello.say/0 function."
  def run(_) do
    Mix.Task.run("app.start")

    url = "https://raw.githubusercontent.com/DockYard-Academy/beta_curriculum/main/start.livemd"

    {:ok, %HTTPoison.Response{body: body}} = HTTPoison.get(url)

    outline =
      Regex.replace(~r/\[([^\]]+)\]\(([^\)]+\.livemd)\)/, body, fn _, file_name, file_path ->
        academy_url = "https://github.com/DockYard-Academy/curriculum/blob/main/#{file_path}"
        query = %{"url" => academy_url}
        query_params = URI.encode_query(query)
        result = "https://livebook.dev/run?" <> query_params
        "[#{file_name}](#{result})"
      end)

    content = """
    %{
      title: "Hello start table of contents",
    }
    ---
    #{outline}
    """

    File.write("priv/posts/course_outline.md", content)
  end
end
