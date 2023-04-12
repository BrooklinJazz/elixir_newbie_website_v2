defmodule ElixirNewbieWeb.BlogShowLive do
  @moduledoc """
  Display a list os Blog posts
  """
  use ElixirNewbieWeb, :live_view
  import ElixirNewbieWeb.Components.BlogCard
  import ElixirNewbieWeb.Components.ResponsiveLayout
  alias ElixirNewbie.Blog

  def render(assigns) do
    ~H"""
    <p>Hello Blog</p>
    """
  end

  def mount(_params, _session, socket) do
    {:ok, socket}
  end
end
