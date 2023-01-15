defmodule Mix.Tasks.Sync do
  @moduledoc "Sync DockYard Academy Content With Nimble Publisher"
  use Mix.Task

  @shortdoc @moduledoc
  def run(_) do
    Mix.Task.run("app.start")
    url = "https://raw.githubusercontent.com/DockYard-Academy/beta_curriculum/main/start.livemd"

    {:ok, %HTTPoison.Response{body: body}} = HTTPoison.get(url)

    Regex.scan(~r/\* \[([^\]]+)\]\(([^\)]+)\)/, body)
    |> Enum.each(fn [_full_match, title, file_name] ->
      page_url =
        "https://raw.githubusercontent.com/DockYard-Academy/beta_curriculum/main/#{file_name}"

      {:ok, %HTTPoison.Response{body: markdown}} = HTTPoison.get(page_url)

      File.write!("./priv/academy_content/#{Path.rootname(Path.basename(file_name))}.md", """
      %{
        title: "#{title}"
      }
      ---
      #{markdown}
      """)
    end)
  end
end
