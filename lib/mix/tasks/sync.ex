defmodule Mix.Tasks.Sync do
  @moduledoc "Sync DockYard Academy Content With Nimble Publisher"
  use Mix.Task
  @requirements ["course_outline"]

  @shortdoc @moduledoc
  def run(_) do
    IO.puts("running: Sync")
    Mix.Task.run("app.start")
    url = "https://raw.githubusercontent.com/DockYard-Academy/beta_curriculum/main/start.livemd"

    {:ok, %HTTPoison.Response{body: body}} = HTTPoison.get(url)

    File.rm_rf("./priv/academy_content")
    File.mkdir_p("./priv/academy_content/reading")
    File.mkdir_p("./priv/academy_content/exercises")

    Regex.scan(~r/
    \*\s          # Bullet point
    \[([^\]]+)\]  # Markdown link name
    \(([reading|exercises][^\)]+)\)  # Markdown link url
    /x, body)
    |> Enum.each(fn [_full_match, title, file_name] ->
      page_url =
        "https://raw.githubusercontent.com/DockYard-Academy/beta_curriculum/main/#{file_name}"
      {:ok, %HTTPoison.Response{body: markdown}} = HTTPoison.get(page_url)

      File.write!("./priv/academy_content/#{Path.rootname(file_name)}.md", """
      %{
        title: "#{title}"
      }
      ---
      #{markdown}
      """)
    end)
  end
end
