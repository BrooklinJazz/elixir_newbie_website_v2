defmodule ElixirNewbieWeb.ContentLive do
  use ElixirNewbieWeb, :live_view

  def render(assigns) do
    ~H"""
    <section class="min-h-screen bg-black text-white">
      <.navigation />
      <section class="mx-auto w-2/3 pb-24">
        <a class="mb-10 block rounded-lg bg-gray-500 p-6 text-2xl hover:opacity-75" href={@badge_url}>
          Run in Livebook
        </a>
        <div class="markdown">
          <%= raw(@lesson.body) %>
        </div>
      </section>
    </section>
    """
  end

  def mount(%{"id" => id}, _session, socket) do
    # hrefs will include the .livemd in the url so we remove it.
    path = Path.basename(id, ".livemd")
    lesson = ElixirNewbie.AcademyContent.get_lesson(path, socket.assigns.live_action)

    url =
      "https://github.com/DockYard-Academy/curriculum/blob/main/#{socket.assigns.live_action}/#{path}.livemd"

    query_params = URI.encode_query(%{"url" => url})
    badge_url = "https://livebook.dev/run?" <> query_params
    {:ok, assign(socket, lesson: lesson, badge_url: badge_url)}
  end
end
