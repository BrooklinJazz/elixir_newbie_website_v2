defmodule ElixirNewbie.Podcast do
  @moduledoc """
  Podcast Context
  """

  alias ElixirNewbie.Podcast.PodcastEpisode
  alias ElixirNewbie.Podcast.PodcastAPI
  alias ElixirNewbie.Podcast.Formatter

  @doc """
  List all podcast episodes as PodcastEpisode structs.

  ## Examples
      Podcast.all_episodes()
      [%ElixirNewbie.PodcastEpisode{}, ...]
  """
  defdelegate all_episodes, to: PodcastAPI
  defdelegate to_hh_mm_ss(seconds), to: Formatter

  @spec latest_episode() :: PodcastEpisode.t()
  def latest_episode, do: hd(all_episodes())

  @spec episode_count() :: integer()
  def episode_count, do: Enum.count(all_episodes())

  @spec get!(integer()) :: PodcastEpisode.t()
  def get!(episode_number) do
    case Enum.find(all_episodes(), fn episode -> episode.episode_number == episode_number end) do
      nil -> raise "Episode #{inspect(episode_number)} not found."
      episode -> episode
    end
  end
end
