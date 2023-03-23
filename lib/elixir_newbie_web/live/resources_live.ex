defmodule ElixirNewbieWeb.ResourcesLive do
  use ElixirNewbieWeb, :live_view

  def render(assigns) do
    ~H"""
    <section class="bg-[url('/images/background-smoke-transparent.webp')] min-h-screen bg-black bg-no-repeat bg-contain text-white">
      <.navigation />
      <section class="mx-auto flex h-fit w-full flex-col gap-12 4k:gap-36 sm:w-full md:w-3/4 lg:w-full lg:flex-row xl:w-3/4 xl:gap-24">
          <!-- Jumbotron -->
        <div class="mx-auto mb-8 w-4/5 rounded-lg bg-purple-900 bg-opacity-30 p-6 text-white">
          <h2 class="mb-5 text-3xl font-semibold">Welcome to the Elixir Newbie Community!</h2>
          <p>
          This is a representation of a DockYard Academy curriculum page, graciously open sourced by <a href="https://dockyard.com/" class="underline">DockYard</a>. There are two major parts of being able to interact with the curriculum, the first is the curriculum and the second is the livebook app.<br/>
          <li>The curriculum repo can be found <a href="https://github.com/DockYard-Academy/beta_curriculum" class="underline">here</a>.</li>
          <li>Then install livebook and open the curriculum, that can be found <a href="https://livebook.dev/" class="underline">here</a>.</li><br/>
          The following link to the <a href="https://github.com/DockYard-Academy/beta_curriculum/wiki/Student-Setup-Guide" class="underline">Student Setup Guide</a> will provide the steps to create an Elixir development environment.<br/>
          For support with setting up the curriculum with livebook as well as with the many concepts in the course material visit us on the Elixir Newbie Discord Server <a href="https://discord.gg/VzF8fHAC" class="underline">here</a>.
          </p>
        </div>
          <!-- Jumbotron -->
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
