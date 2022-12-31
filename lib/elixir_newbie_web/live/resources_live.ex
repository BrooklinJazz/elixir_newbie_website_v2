defmodule ElixirNewbieWeb.ResourcesLive do
  use ElixirNewbieWeb, :live_view

  def render(assigns) do
    ~H"""
    <section class="text-white">
      <p>Resources</p>
      <%= for post <- @posts do %>
        <%= raw post.body %>
      <% end %>
    </section>
    """
  end

  def mount(_params, _session, socket) do
    {:ok, assign(socket, [posts: ElixirNewbie.Blog.all_posts])}
  end
end
