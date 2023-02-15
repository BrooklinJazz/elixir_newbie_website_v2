defmodule ElixirNewbieWeb.ContentLive do
  use ElixirNewbieWeb, :live_view

  def render(assigns) do
    ~H"""
    <section class="bg-[url('/images/background-smoke-transparent.webp')] min-h-screen bg-black bg-no-repeat bg-contain text-white">
      <.navigation />
      <section class="w-2/3 mx-auto">
        <div class="markdown">
          <%= raw @lesson.body%>
        </div>
      </section>
    </section>
    """
  end

  def mount(%{"id" => id}, _session, socket) do
    IO.inspect(socket.assigns.live_action)
    lesson = ElixirNewbie.AcademyContent.get_lesson(id, socket.assigns.live_action)

    {:ok, assign(socket, lesson: lesson)}
  end
end
