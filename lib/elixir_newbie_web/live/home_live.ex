defmodule ElixirNewbieWeb.HomeLive do
  use ElixirNewbieWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok,
     assign(socket,
       page_title: "Home",
       ready_for_animations: connected?(socket),
       page_background: "/images/background-smoke-transparent.webp"
     )}
  end

  def render(assigns) do
    ~H"""
    <section class="bg-[url('/images/background-smoke-transparent.webp')] flex-col h-screen min-h-screen bg-black bg-no-repeat bg-cover">
      <.navigation/>
       <section class="mx-auto flex w-full flex-col gap-12 4k:gap-36 sm:w-full md:w-3/4 lg:w-full lg:flex-row xl:w-3/4 xl:gap-24">
        <article class="grid h-fit w-full grid-cols-6 grid-rows-6">
          <article class="aspect-square relative col-start-1 col-end-6 row-start-1 row-end-6 rounded-full border-t-4 border-l-4 border-white">
            <img
              class="rounded-full"
              alt="home page icon of a wizard"
              src="images/home_page_icon_reduced.webp"
            />
          </article>
          <%= if @ready_for_animations do %>
            <.round_link link={"https://discord.gg/XBAAmuZGXU"} position={"row-start-5 col-start-2 relative right-2 top-1/3"} logo={"images/discord_icon.png"}>Join our Discord</.round_link>
            <.round_link link={"https://twitter.com/BrooklinJMyers"} position={"row-start-3 col-start-5 relative left-1/2 bottom-1/3"} logo={"images/twitter_icon_reduced.webp"}>Twitter</.round_link>
            <.round_link link={"https://github.com/BrooklinJazz"} position={"relative col-start-5 relative left-1/3 sm:left-1/4 row-start-4"} logo={"images/github_icon_reduced.webp"}>GitHub</.round_link>
            <.round_link link={"https://www.linkedin.com/in/brooklinmyers/"} position={"row-start-5 col-start-4 relative left-1/2"} logo={"images/linkedin_icon_reduced.webp"}>Linkedin</.round_link>
            <.round_link link={"https://github.com/DockYard-Academy/beta_curriculum"} position={"row-start-5 col-start-3 relative left-1/4 top-1/2"} logo={"images/dockyard_academy_icon_reduced.webp"}>Dockyard Academy</.round_link>
          <% end %>
        </article>
        <article class="flex w-full flex-col text-2xl text-white 4k:text-4xl lg:text-2xl">
          <h1>Greetings, traveler, My name is Brooklin. I am here to teach you Elixir. Where should we start?</h1>
            <.rectangle_link navigate={~p"/blog"} src="images/blog_button_reduced.webp" alt="Magic Psychedelic Books">1. Read the Blog</.rectangle_link>
            <.rectangle_link navigate={~p"/podcast"} src="images/podcast_button_reduced.webp" alt="Avatar-like half face">2. Listen to the Podcast</.rectangle_link>
            <.rectangle_link navigate={~p"/resources"} src="images/resources_button_reduced.webp" alt="Fantasy Mushroom Forest">3. Explore Learning Resources</.rectangle_link>
            <.rectangle_link navigate={~p"/community"} src="images/resources_button_reduced.webp"  alt="Fantasy Mushroom Forest">4. Join The Community</.rectangle_link>
        </article>
      </section>
    </section>
    """
  end

  def rectangle_link(assigns) do
    ~H"""
    <.link
      navigate={@navigate}
      class={[
        "mt-4 xl:mt-8 text-left relative rounded-3xl aspect-[7/1]",
        "transition duration-500 ease-in-out ring ring-white hover:ring-offset-2 overflow-hidden"
      ]}
    >
      <h2 class={"absolute flex h-full w-full items-center pl-16"} ><%= render_slot(@inner_block) %></h2>
       <img alt={@alt} src={@src} class="rounded-3xl object-cover"/>
    </.link>
    """
  end

  def round_link(assigns) do
    ~H"""
    <.link
      href={@link}
      class={"#{@position} group animate-fade-in"}
      >
      <div class="transition duration-300 ease-in-out group-hover:scale-110">
        <div class="animate-spin-slow absolute h-full w-full rounded-full border-l-2 border-cyan-600"/>
        <img alt={render_slot(@inner_block)} class="rounded-full border-2" src={@logo}/>
        <p class="absolute mt-1 w-full text-center text-sm text-white opacity-0 transition duration-300 ease-in-out group-hover:opacity-100"><%= render_slot(@inner_block) %></p>
        </div>
    </.link>
    """
  end
end
