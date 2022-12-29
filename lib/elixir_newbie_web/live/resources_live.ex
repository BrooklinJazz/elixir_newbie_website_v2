defmodule ElixirNewbieWeb.ResourcesLive do
  use ElixirNewbieWeb, :live_view

  def render(assigns) do
    ~H"""
    Resources
    """
  end

  def mount(_params, _session, socket) do
    {:ok, socket}
  end
end
