defmodule ElixirNewbieWeb.BlogLive do
  use ElixirNewbieWeb, :live_view

  def render(assigns) do
    ~H"""
    Blog
    """
  end

  def mount(_params, _session, socket) do
    {:ok, socket}
  end
end
