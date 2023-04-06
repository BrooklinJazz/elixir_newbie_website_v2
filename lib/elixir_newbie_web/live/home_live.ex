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
    <%!-- without overflow hidden the page sometimes provides a scrollbar due to animations --%>
    <section class="bg-[url('/images/HomeBackground.webp')] flex-col h-screen min-h-screen bg-black bg-no-repeat bg-cover overflow-hidden">
      <.navigation/>
       <section class="mx-auto flex w-full flex-col gap-12 4k:mt-36 4k:w-1/2 4k:gap-36 sm:w-full md:w-3/4 lg:w-full lg:flex-row xl:w-3/4 xl:gap-24">
        <article class="grid h-fit w-full grid-cols-6 grid-rows-6">
          <.link target="_blank" navigate="https://dockyard.com/blog/2022/07/26/what-to-expect-from-the-dockyard-academy-q-a-with-instructor-brooklin-myers" class={"aspect-square relative col-start-1 col-end-6 row-start-1 row-end-6 overflow-hidden rounded-full border-t-4 border-l-4 border-white"}>
            <p class={[
              "text-center flex items-center justify-center absolute h-full w-full text-white text-2xl",
              "transition ease-in-out duration-300 opacity-0 hover:cursor-pointer hover:bg-black/50 hover:opacity-100"
              ]}>
              Brooklin Myers
            </p>
            <img
              class="h-full w-full"
              alt="home page icon of a wizard"
              src="images/HomeWizard.webp"
            />
          </.link>
          <%= if @ready_for_animations do %>
            <.round_link link={"https://discord.gg/XBAAmuZGXU"} position={"row-start-5 col-start-2 relative right-2 top-1/3"} logo={"images/DiscordIcon.webp"}>Join our Discord</.round_link>
            <.round_link link={"https://twitter.com/BrooklinJMyers"} position={"row-start-3 col-start-5 relative left-1/2 bottom-1/3"} logo={"images/TwitterIcon.webp"}>Twitter</.round_link>
            <.round_link link={"https://github.com/BrooklinJazz"} position={"relative col-start-5 relative left-1/3 sm:left-1/4 row-start-4"} logo={"images/GitHubIcon.webp"}>GitHub</.round_link>
            <.round_link link={"https://www.linkedin.com/in/brooklinmyers/"} position={"row-start-5 col-start-4 relative left-1/2"} logo={"images/LinkedinIcon.webp"}>Linkedin</.round_link>
            <.round_link link={"https://github.com/DockYard-Academy/beta_curriculum"} position={"row-start-5 col-start-3 relative left-1/4 top-1/2"} logo={"images/DockYardAcademyIcon.webp"}>Dockyard Academy</.round_link>
          <% end %>
        </article>
        <article class="flex w-full flex-col text-2xl text-white 4k:text-4xl lg:text-2xl">
          <h1>Greetings, traveler, My name is Brooklin. I am here to teach you Elixir. Where should we start?</h1>
          <.rectangle_link navigate={~p"/blog"} src="images/BlogButton.webp" alt="Fantasy Book Shelf">1. Read the Blog</.rectangle_link>
          <.rectangle_link navigate={~p"/podcast"} src="images/PodcastButton.webp" alt="Fantasy Face In Flowers">2. Listen to the Podcast</.rectangle_link>
          <.rectangle_link navigate={~p"/resources"} src="images/ResourcesButton.webp" alt="Fantasy Mushroom Forest">3. Explore Learning Resources</.rectangle_link>
          <.rectangle_link navigate={~p"/community"} src="images/CommunityButton.webp"  alt="Fantasy Village">4. Join The Community</.rectangle_link>
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
        "mt-4 xl:mt-8 text-left relative rounded-3xl aspect-[7/1] overflow-hidden",
        "transition duration-500 ease-in-out ring ring-white hover:ring-offset-2"
      ]}
    >
      <h2 class={
        [
          "absolute flex h-full w-full items-center pl-16",
          "transition duration-300 ease-in-out bg-black/30 hover:bg-black/0"
        ]}><%= render_slot(@inner_block) %></h2>
      <img alt={@alt} src={@src} class="w-full rounded-3xl object-cover"/>
    </.link>
    """
  end

  def round_link(assigns) do
    ~H"""
    <.link
      href={@link}
      class={"#{@position} group animate-fade-in"}
      target="_blank"
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
