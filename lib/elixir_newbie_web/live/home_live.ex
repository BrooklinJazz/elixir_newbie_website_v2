defmodule ElixirNewbieWeb.HomeLive do
  use ElixirNewbieWeb, :live_view

  def render(assigns) do
    ~H"""
    <section class="flex h-fit w-full flex-col gap-12 xl:gap-24 4k:gap-36 lg:flex-row">
      <article class="grid h-fit w-full grid-cols-6 grid-rows-6">
        <div class="rounded-full border-4 border-white row-start-1 row-end-6 col-start-1 aspect-square col-end-6 rounded-full bg-cover bg-[url('/images/wizard_home_page.png')]" />
        <.link href="https://twitter.com/BrooklinJMyers" class="rounded-full border-4 border-white bg-[url('/images/twitter.png')] bg-cover row-start-3 col-start-5 relative left-1/2 bottom-1/4"></.link>
        <.link href="https://github.com/BrooklinJazz" class="rounded-full border-4 border-white bg-[url('/images/github.png')] bg-cover relative col-start-5 relative left-1/4 row-start-4"></.link>
        <.link href="https://www.linkedin.com/in/brooklinmyers/" class="rounded-full border-4 border-white bg-[url('/images/linkedin.png')] bg-cover row-start-5 col-start-4 relative left-1/2"></.link>
        <.link href="https://github.com/DockYard-Academy/beta_curriculum" class="rounded-full border-4 border-white bg-[url('/images/dockyard_magic.png')] bg-cover row-start-5 col-start-3 relative left-1/4 top-1/2"></.link>
      </article>
      <article class="h-100 flex w-full flex-col text-xl lg:text-2xl text-white 4k:text-4xl">
        You walk through the woods and find a Wizard.

        “Hello, I’m Brooklin” the Wizard says.
        “I’m here to teach you Elixir”.

        The wizard takes you to a fork in the road, many paths lie before you. What do you do?
        <.link class="bg-[url('/images/wavy_books.png')] border-4 border-white bg-cover bg-bottom mt-6 xl:mt-10 rounded-3xl border p-6 lg:p-8 4k:p-12 pl-8 text-left" patch={~p"/blog"}>1. Read the Blog</.link>
        <.link class="bg-[url('/images/flower_background.png')] border-4 border-white bg-cover bg-center mt-4 xl:mt-8 rounded-3xl border p-6 lg:p-8 4k:p-12 pl-8 text-left" patch={~p"/podcast"}>2. Listen to the Podcast</.link>
        <.link class="bg-[url('/images/dark_mushrooms.png')] border-4 border-white bg-cover bg-center mt-4 xl:mt-8 rounded-3xl border p-6 lg:p-8 4k:p-12 pl-8 text-left" patch={~p"/resources"}>3. Learning Resources</.link>
      </article>
    </section>
    """
  end

  def mount(_params, _session, socket) do
    {:ok, socket}
  end
end
