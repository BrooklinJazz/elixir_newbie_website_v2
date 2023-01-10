defmodule ElixirNewbie.Podcast.PodcastEpisode do
  @moduledoc """
  Podcast Episode
  """
  @type t :: %__MODULE__{
          title: String.t(),
          description: String.t(),
          audio_url: String.t(),
          artwork_url: String.t(),
          published_at: Calendar.datetime(),
          duration: String.t(),
          season_number: integer(),
          episode_number: integer()
        }

  @enforce_keys [
    :title,
    :description,
    :audio_url,
    :artwork_url,
    :published_at,
    :duration,
    :season_number,
    :episode_number
  ]

  defstruct @enforce_keys
end
