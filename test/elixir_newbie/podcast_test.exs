defmodule ElixirNewbie.PodcastTest do
  use ExUnit.Case, async: true
  doctest ElixirNewbie.Podcast
  alias ElixirNewbie.Podcast
  alias ElixirNewbie.Podcast.PodcastEpisode
  alias ElixirNewbie.Podcast.PodcastAPI

  @tag :external
  test "all_episodes/0" do
    assert [%PodcastEpisode{} | _episodes] = Podcast.all_episodes()
  end

  @tag :external
  test "latest_episode/0" do
    [latest | _episodes] = Podcast.all_episodes()
    assert Podcast.latest_episode() == latest
  end
end
