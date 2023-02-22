defmodule ElixirNewbieWeb.ContentLive do
  use ElixirNewbieWeb, :live_view

  def render(assigns) do
    ~H"""
    <section class="bg-[url('/images/background-smoke-transparent.webp')] min-h-screen bg-black bg-no-repeat bg-contain text-white">
      <.navigation />
      <section class="w-2/3 mx-auto">
        <a class="bg-gray-500 hover:opacity-75 rounded-lg text-2xl p-6 mb-10 block" href={@badge_url}>Run in Livebook</a>
        <div class="markdown">
          <%= raw @lesson.body%>
        </div>
      </section>
    </section>
    """
  end

  def mount(%{"id" => id}, _session, socket) do
    lesson = ElixirNewbie.AcademyContent.get_lesson(id, socket.assigns.live_action)
    url = "https://github.com/DockYard-Academy/curriculum/blob/main/#{socket.assigns.live_action}/#{id}.livemd"
    query_params = URI.encode_query(%{"url" => url})
    badge_url = "https://livebook.dev/run?" <> query_params
    {:ok, assign(socket, lesson: lesson, badge_url: badge_url)}
  end
end
