defmodule ElixirNewbieWeb.HomeLive do
  use ElixirNewbieWeb, :live_view

  def render(assigns) do
    ~H"""
    <section class="flex h-fit w-full flex-col gap-12 4k:gap-36 lg:flex-row xl:gap-24">
      <article class="grid h-fit w-full grid-cols-6 grid-rows-6">
        <article class="rounded-full row-start-1 row-end-6 col-start-1 aspect-square col-end-6 relative">
          <div class="h-full w-full absolute rounded-full border-t-4 border-l-4 border-white"/>
          <img
            class="rounded-full"
            alt="home page icon of a wizard"
            src="images/home_page_icon_reduced.webp"
          />
        </article>
        <.link
          href="https://twitter.com/BrooklinJMyers"
          class="row-start-3 col-start-5 relative left-1/2 bottom-1/3 group"
        >
          <div class="h-full w-full border-4 border-dotted absolute rounded-full animate-fade-in transition duration-300 ease-in-out group-hover:scale-110"/>
          <img alt="Twitter Icon Button" class="rounded-full p-1" src="images/twitter_icon_reduced.webp"/>
          <p class="absolute -bottom-6 w-full text-center text-sm text-white">Twitter</p>
        </.link>
        <.link
          href="https://github.com/BrooklinJazz"
          class="relative col-start-5 relative left-1/3 sm:left-1/4 row-start-4 group"
        >
          <div class="h-full w-full border-4 border-dotted absolute rounded-full animate-fade-in transition duration-300 ease-in-out group-hover:scale-110"/>
          <img alt="GitHub Icon Button" class="rounded-full p-1" src="images/github_icon_reduced.webp"/>
          <p class="absolute -bottom-6 w-full text-center text-sm text-white">GitHub</p>
        </.link>
        <.link
          href="https://www.linkedin.com/in/brooklinmyers/"
          class="row-start-5 col-start-4 relative left-1/2 group"
        >
          <div class="h-full w-full border-4 border-dotted absolute rounded-full animate-fade-in transition duration-300 ease-in-out group-hover:scale-110"/>
          <img alt="Linkedin Icon Button" class="rounded-full p-1" src="images/linkedin_icon_reduced.webp"/>
          <p class="absolute -bottom-6 w-full text-center text-sm text-white">Linkedin</p>
        </.link>
        <.link
          href="https://github.com/DockYard-Academy/beta_curriculum"
          class="row-start-5 col-start-3 relative left-1/4 top-1/2 group"
        >
          <div class="h-full w-full border-4 border-dotted absolute rounded-full animate-fade-in transition duration-300 ease-in-out group-hover:scale-110"/>
          <img alt="DockYard Academy Icon Button" class="rounded-full p-1" src="images/dockyard_academy_icon_reduced.webp"/>
          <p class="absolute -bottom-12 w-full text-center text-sm text-white">DockYard Academy</p>
        </.link>
      </article>
      <article class="flex w-full flex-col text-2xl text-white 4k:text-4xl lg:text-2xl">
        <h1>Greetings, traveler, My name is Brooklin. I am here to teach you Elixir. Where should we start?</h1>
          <.rectangle_link navigate={~p"/blog"} src="images/blog_button_reduced.webp">1. Read the Blog</.rectangle_link>
          <.rectangle_link navigate={~p"/podcast"} src="images/podcast_button_reduced.webp">2. Listen to the Podcast</.rectangle_link>
          <.rectangle_link navigate={~p"/resources"} src="images/resources_button_reduced.webp">3. Explore Learning Resources</.rectangle_link>
      </article>
    </section>
    """
  end

  def mount(_params, _session, socket) do
    {:ok, assign(socket, :page_title, "Home")}
  end
end
