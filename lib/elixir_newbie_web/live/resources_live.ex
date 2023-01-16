defmodule ElixirNewbieWeb.ResourcesLive do
  use ElixirNewbieWeb, :live_view

  def render(assigns) do
    ~H"""
    <section class="text-white">
      <p>Resources</p>
      <%= for post <- @posts do %>
        <div class="markdown">
        <%= raw post.body %>
        </div>
      <% end %>
      </ul>
    </section>
    """
  end

  def mount(_params, _session, socket) do
    lessons = ElixirNewbie.AcademyContent.all_lessons()
    {:ok, assign(socket, lessons: lessons)}
  end
end
