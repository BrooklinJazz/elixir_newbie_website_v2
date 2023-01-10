defmodule ElixirNewbie.Podcast.PodcastAPI do
  @moduledoc """
  Podcast API for retrieving podcast episodes from buzzsprout.
  """
  alias ElixirNewbie.Podcast.PodcastEpisode
  @rss_url "https://feeds.buzzsprout.com/1840381.rss"

  def all_episodes do
    with {:ok, %{body: xml}} <- HTTPoison.get(@rss_url),
         {:ok, json_feed} <- ElixirFeedParser.parse(xml) do
      json_feed.entries
      |> Enum.reverse()
      |> Enum.with_index(fn each, index ->
        %PodcastEpisode{
          title: each.title,
          description: each.description,
          duration: String.to_integer(each.itunes_duration),
          artwork_url: json_feed.image.url,
          audio_url: each.enclosure.url,
          published_at: Map.get(each, :"rss2:pubDate"),
          season_number: 1,
          episode_number: index + 1
        }
      end)
      |> Enum.reverse()
    end
  end

end
