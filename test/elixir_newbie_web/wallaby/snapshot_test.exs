defmodule ElixirNewbieWeb.Wallaby.SnapshotTests do
  use ExUnit.Case, async: true
  use Wallaby.Feature

  @sizes [
    {"sm", 640},
    {"md", 768},
    {"lg", 1024},
    {"xl", 1280},
    {"2xl", 1536},
    {"4k", 3840}
  ]
  @urls [
    "",
    "blog",
    "resources",
    "podcast",
    "discord"
  ]

  @tag :wallaby
  feature "take snapshots", %{session: session} do
    page = visit(session, "/")
    take_screenshot(page, name: "test")
    # Enum.each(@urls, fn url ->
    #   page = visit(session, url)

    #   Enum.each(@sizes, fn {size, width} ->
    #     screen = resize_window(page, width, 2000)

    #     Process.sleep(500)
    #     take_screenshot(screen, name: "#{(url == "" && "home") || url}/#{size}")
    #   end)
    # end)
  end
end
