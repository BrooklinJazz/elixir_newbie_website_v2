defmodule ElixirNewbie.Podcast.PodcastEpisode do
  @moduledoc """
  Podcast Episode
  """
  alias ElixirNewbie.Podcast

  @type t :: %__MODULE__{
          title: String.t(),
          description: String.t(),
          audio_url: String.t(),
          published_at: Calendar.datetime(),
          seconds: integer(),
          hh_mm_ss: String.t(),
          season_number: integer(),
          episode_number: integer()
        }

  @type fields :: %{
          title: String.t(),
          description: String.t(),
          audio_url: String.t(),
          published_at: Calendar.datetime(),
          seconds: integer(),
          season_number: integer(),
          episode_number: integer()
        }

  @enforce_keys [
    :title,
    :description,
    :audio_url,
    :published_at,
    :seconds,
    :hh_mm_ss,
    :season_number,
    :episode_number
  ]

  defstruct @enforce_keys

  @doc """
  Create a new PodcastEpisode struct from a map.

  ## Examples

      iex>
  """
  @spec new(fields()) :: t()
  def new(fields) do
    struct(__MODULE__, Map.put(fields, :hh_mm_ss, Podcast.to_hh_mm_ss(fields.seconds)))
  end
end
