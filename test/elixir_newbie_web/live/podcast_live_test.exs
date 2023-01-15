defmodule ElixirNewbieWeb.PodcastLiveTest do
  use ElixirNewbieWeb.ConnCase, async: true
  doctest ElixirNewbieWeb.PodcastLive
  alias ElixirNewbie.Podcast
  import Phoenix.LiveViewTest

  test "disconnected and connected mount", %{conn: conn} do
    conn = get(conn, ~p"/podcast")
    assert html_response(conn, 200) =~ "Current Episode"

    assert {:ok, _view, html} = live(conn, ~p"/podcast")
    assert html =~ "Current Episode"
  end

  test "displays the latest episode as the current episode", %{conn: conn} do
    latest_episode = Podcast.latest_episode()

    assert {:ok, view, html} = live(conn, ~p"/podcast")

    assert view
           |> element("#current-episode")
           |> render() =~ latest_episode.title
  end

  test "displays clickable episodes", %{conn: conn} do
    episodes = Podcast.all_episodes()

    assert {:ok, view, _html} = live(conn, ~p"/podcast")

    # ensure episode links change the current episode
    Enum.each(episodes, fn episode ->
      view
      |> element("#podcast-episode-#{episode.episode_number}")
      |> render_click()

      assert view
             |> element("#current-episode")
             |> render() =~ episode.title
    end)
  end
end
