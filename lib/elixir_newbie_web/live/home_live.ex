defmodule ElixirNewbieWeb.HomeLive do
  use ElixirNewbieWeb, :live_view

  def render(assigns) do
    ~H"""
    <section class="flex h-fit w-full flex-col gap-12 4k:gap-36 lg:flex-row xl:gap-24">
      <article class="grid h-fit w-full grid-cols-6 grid-rows-6">
        <img alt="home page icon of a wizard" class="rounded-full border-t-4 border-l-4 border-white row-start-1 row-end-6 col-start-1 aspect-square col-end-6" src="images/home_page_icon_reduced.webp" />
        <.link href="https://twitter.com/BrooklinJMyers" class="row-start-3 col-start-5 relative left-1/2 bottom-1/4">
          <img alt="Twitter Icon Button" class="rounded-full border-2" src="images/twitter_icon.webp"/>
          <p class="absolute -bottom-6 w-full text-center text-sm text-white">Twitter</p>
        </.link>
        <.link href="https://github.com/BrooklinJazz" class="relative col-start-5 relative left-1/4 row-start-4">
          <img alt="GitHub Icon Button" class="rounded-full border-2" src="images/github_icon.webp"/>
          <p class="absolute -bottom-6 w-full text-center text-sm text-white">GitHub</p>
        </.link>
        <.link href="https://www.linkedin.com/in/brooklinmyers/" class="row-start-5 col-start-4 relative left-1/2">
          <img alt="Linkedin Icon Button" class="rounded-full border-2" src="images/linkedin_icon.webp"/>
          <p class="absolute -bottom-6 w-full text-center text-sm text-white">Linkedin</p>
        </.link>
        <.link href="https://github.com/DockYard-Academy/beta_curriculum" class="row-start-5 col-start-3 relative left-1/4 top-1/2">
          <img alt="DockYard Academy Icon Button" class="rounded-full border-2" src="images/dockyard_academy_icon.webp"/>
          <p class="absolute -bottom-12 w-full text-center text-sm text-white">DockYard Academy</p>
        </.link>
      </article>
      <article class="flex w-full flex-col text-white text-2xl lg:text-2xl 4k:text-4xl">
        <h1>Greetings, traveler, My name is Brooklin. I am here to teach you Elixir. Where should we start?</h1>
          <.link navigate={~p"/blog"} class={"mt-4 xl:mt-8 text-left relative"} >
            <h2 class="absolute h-full w-full flex items-center pl-16">1. Read the Blog</h2>
            <img alt="Blog" src="images/blog_button.webp" class="rounded-3xl border-4 border-white aspect-[5/1]"/>
          </.link>
          <.link navigate={~p"/podcast"} class={"mt-4 xl:mt-8 text-left relative"} >
            <h2 class="absolute h-full w-full flex items-center pl-16">2. Listen to the Podcast</h2>
            <img alt="Blog" src="images/podcast_button.webp" class="rounded-3xl border-4 border-white aspect-[5/1]"/>
          </.link>
          <.link navigate={~p"/resources"} class={"mt-4 xl:mt-8 text-left relative"} >
            <h2 class="absolute h-full w-full flex items-center pl-16">3. Explore Learning Resources</h2>
            <img alt="Blog" src="images/resources_button.webp" class="rounded-3xl border-4 border-white aspect-[5/1]"/>
          </.link>
      </article>
    </section>
    """
  end

  def mount(_params, _session, socket) do
    {:ok, assign(socket, :page_title, "Home")}
  end
end
