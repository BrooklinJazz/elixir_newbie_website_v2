defmodule ElixirNewbieWeb.PodcastLiveTest do
  use ElixirNewbieWeb.ConnCase, async: true
  doctest ElixirNewbieWeb.PodcastLive
  alias ElixirNewbie.Podcast
  import Phoenix.LiveViewTest

  test "displays the latest episode as the current episode", %{conn: conn} do
    latest_episode = Podcast.latest_episode()

    assert {:ok, view, _html} = live(conn, ~p"/podcast")

    assert view
           |> render() =~ latest_episode.title
  end

  test "play and pause toggle", %{conn: conn} do
    assert {:ok, view, _html} = live(conn, ~p"/podcast")

    assert has_element?(view, "#player-play")
    refute has_element?(view, "#player-pause")

    assert view |> element("#player-play") |> render_click()

    refute has_element?(view, "#player-play")
    assert has_element?(view, "#player-pause")

    assert view |> element("#player-pause") |> render_click()

    assert has_element?(view, "#player-play")
    refute has_element?(view, "#player-pause")
  end

  test "audio player forward and back", %{conn: conn} do
    assert {:ok, view, _html} = live(conn, ~p"/podcast")

    assert view |> element("#player-forward") |> render_click()
    assert assert_push_event(view, "forward", %{})

    assert view |> element("#player-backward") |> render_click()
    assert assert_push_event(view, "backward", %{})
  end

  test "time-update", %{conn: conn} do
    assert {:ok, view, _html} = live(conn, ~p"/podcast")
    assert view |> element("#player-time") |> render() =~ "0:00"
    assert render_hook(view, "time-update", %{seconds: 15})
    assert view |> element("#player-time") |> render() =~ "0:15"
  end

  test "set-volume", %{conn: conn} do
    assert {:ok, view, _html} = live(conn, ~p"/podcast")
    assert view |> has_element?("#player-volume")

    assert render_hook(view, "set-volume", %{volume: "1"})
    assert view |> has_element?("#player-speaker-wave")

    assert render_hook(view, "set-volume", %{volume: "0.5"})
    assert view |> has_element?("#player-speaker-wave")

    assert render_hook(view, "set-volume", %{volume: "0"})
    assert view |> has_element?("#player-speaker-x-mark")
  end

  test "toggle playback rate", %{conn: conn} do
    assert {:ok, view, _html} = live(conn, ~p"/podcast")

    assert element(view, "#player-playback-rate") |> render() =~ "1"

    assert view
           |> element("#player-playback-rate")
           |> render_click() =~ "1.5"

    assert view
           |> element("#player-playback-rate")
           |> render_click() =~ "2"

    assert view
           |> element("#player-playback-rate")
           |> render_click() =~ "2.5"

    assert view
           |> element("#player-playback-rate")
           |> render_click() =~ "3"

    assert view
           |> element("#player-playback-rate")
           |> render_click() =~ "1"
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
             |> render() =~ episode.title
    end)
  end
end
