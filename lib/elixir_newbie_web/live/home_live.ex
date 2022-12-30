defmodule ElixirNewbieWeb.HomeLive do
  use ElixirNewbieWeb, :live_view

  def render(assigns) do
    ~H"""
    <section class="flex h-fit w-full flex-col gap-12 4k:gap-36 lg:flex-row xl:gap-24">
      <article class="grid h-fit w-full grid-cols-6 grid-rows-6">
        <div class="rounded-full border-t-4 border-l-4 border-white row-start-1 row-end-6 col-start-1 aspect-square col-end-6 rounded-full bg-cover bg-[url('/images/wizard_home_page.png')]" />
        <.link href="https://twitter.com/BrooklinJMyers" class="rounded-full border-2 border-white bg-[url('/images/twitter.png')] bg-cover row-start-3 col-start-5 relative left-1/2 bottom-1/4">
          <p class="absolute -bottom-6 w-full text-center text-sm text-white">Twitter</p>
        </.link>
        <.link href="https://github.com/BrooklinJazz" class="rounded-full border-2 bg-[url('/images/github_reduced.png')] bg-cover relative col-start-5 relative left-1/4 row-start-4">
          <p class="absolute -bottom-6 w-full text-center text-sm text-white">GitHub</p>
        </.link>
        <.link href="https://www.linkedin.com/in/brooklinmyers/" class="rounded-full border-2 border-white bg-[url('/images/linkedin.png')] bg-cover row-start-5 col-start-4 relative left-1/2">
          <p class="absolute -bottom-6 w-full text-center text-sm text-white">Linkedin</p>
        </.link>
        <.link href="https://github.com/DockYard-Academy/beta_curriculum" class="rounded-full border-2 border-white bg-[url('/images/dockyard_academy_reduced.png')] bg-cover row-start-5 col-start-3 relative left-1/4 top-1/2">
          <p class="absolute -bottom-12 w-full text-center text-sm text-white">DockYard Academy</p>
        </.link>
      </article>
      <article class="h-100 flex w-full flex-col text-xl text-white 4k:text-4xl lg:text-2xl">
        <p>
        You walk through the woods and find a Wizard. “Hello, I’m Brooklin,” the Wizard says. “I’m here to teach you Elixir.” The Wizard takes you to a fork in the road. Many paths lie before you. What do you do?
        </p>
        <.rectangle_link class="bg-[url('/images/wavy_books.png')] bg-bottom" patch={~p"/blog"}>1. Read the Blog</.rectangle_link>
        <.rectangle_link class="bg-[url('/images/flower_background.png')] bg-center" patch={~p"/podcast"}>2. Listen to the Podcast</.rectangle_link>
        <.rectangle_link class="bg-[url('/images/dark_mushrooms.png')] bg-center" patch={~p"/resources"}>3. Learning Resources</.rectangle_link>
      </article>
    </section>
    """
  end

  def mount(_params, _session, socket) do
    {:ok, socket}
  end
end
