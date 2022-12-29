defmodule ElixirNewbieWeb.HomeLive do
  use ElixirNewbieWeb, :live_view

  def render(assigns) do
    ~H"""
    Hello World
    """
  end

  def mount(_params, _session, socket) do
    {:ok, socket}
  end
end
