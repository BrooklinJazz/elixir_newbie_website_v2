defmodule ElixirNewbie.PodcastTest do
  use ExUnit.Case, async: true
  doctest ElixirNewbie.Podcast
  alias ElixirNewbie.Podcast
  alias ElixirNewbie.Podcast.PodcastEpisode

  test "all_episodes/0" do
    assert [%PodcastEpisode{} | _episodes] = Podcast.all_episodes()
  end

  test "latest_episode/0" do
    [latest | _episodes] = Podcast.all_episodes()
    assert Podcast.latest_episode() == latest
  end

  test "to_hh_mm_ss/1" do
    assert Podcast.to_hh_mm_ss(120) == "2:00"
    assert Podcast.to_hh_mm_ss(60 * 12 + 10) == "12:10"
    assert Podcast.to_hh_mm_ss(60 * 60 + 10) == "1:00:10"
  end
end
