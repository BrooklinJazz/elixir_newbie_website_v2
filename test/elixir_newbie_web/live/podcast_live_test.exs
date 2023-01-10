defmodule ElixirNewbieWeb.PodcastLiveTest do
  use ElixirNewbieWeb.ConnCase, async: true
  doctest ElixirNewbieWeb.PodcastLive
  alias ElixirNewbieWeb.PodcastLive
  alias ElixirNewbie.Podcast
  import Phoenix.LiveViewTest

  test "disconnected and connected mount", %{conn: conn} do
    conn = get(conn, ~p"/podcast")
    assert html_response(conn, 200) =~ "Current Episode"

    assert {:ok, _view, html} = live(conn, ~p"/podcast")
    assert html =~ "Currentl Episode"
  end

  @tag :external
  test "by default, display the latest episode", %{conn: conn} do
    latest_episode = Podcast.latest_episode()

    assert {:ok, _view, html} = live(conn, ~p"/podcast")
    assert html =~ latest_episode.title
    assert html =~ latest_episode.description
  end

  test "format_seconds/1" do
    assert PodcastLive.format_seconds(120) == "2:00"
    assert PodcastLive.format_seconds(60 * 12 + 10) == "12:10"
    assert PodcastLive.format_seconds(60 * 60 + 10) == "1:00:10"
  end
end
