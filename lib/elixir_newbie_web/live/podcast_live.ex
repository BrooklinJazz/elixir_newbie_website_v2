defmodule ElixirNewbieWeb.PodcastLive do
  use ElixirNewbieWeb, :live_view

  def render(assigns) do
    ~H"""
    Podcast
    """
  end

  def mount(_params, _session, socket) do
    {:ok, socket}
  end
end
