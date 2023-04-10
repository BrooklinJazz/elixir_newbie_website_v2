defmodule ElixirNewbieWeb.DockYardAcademyLive do
  use ElixirNewbieWeb, :live_view

  def render(assigns) do
    ~H"""
    <section class="bg-[url('/images/DockYardAcademyBackground.webp')] min-h-screen bg-black bg-no-repeat bg-contain text-white">
      <.navigation />
      <section class="mx-auto flex h-fit w-full flex-col gap-12 4k:gap-36 sm:w-full md:w-3/4 lg:w-full lg:flex-row xl:w-3/4 xl:gap-24">
        <article class="bg-purple-900/30 mx-auto mb-8 w-4/5 rounded-lg p-6 text-center text-white">
          <h2 class="mb-5 text-3xl font-semibold">DockYard Academy</h2>
          <h3 class="text-2xl">An open-source Elixir curriculum built with Livebook</h3>
          <p class="xl mt-2">This is a web-version preview of the curriculum. See our <a href="https://github.com/DockYard-Academy/curriculum" class="text-cyan-500 underline">GitHub</a> to get started with the LiveBook version.</p>
        </article>
      </section>
      <section class="mx-auto w-2/3">
        <div class="curriculum_outline markdown">
          <%= raw @outline.body %>
        </div>
      </section>
    </section>
    """
  end

  def mount(_params, _session, socket) do
    outline = ElixirNewbie.CourseOutline.outline()

    {:ok, assign(socket, outline: outline)}
  end
end
