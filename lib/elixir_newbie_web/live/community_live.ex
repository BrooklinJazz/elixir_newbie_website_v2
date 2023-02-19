defmodule ElixirNewbieWeb.CommunityLive do
  use ElixirNewbieWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end


  @impl true
  def render(assigns) do
    ~H"""
    <section class="bg-[url('/images/podcast_background.webp')] text-white bg-top min-h-screen bg-black bg-no-repeat bg-contain pb-96">
      <.navigation/>
      <h1 class="mb-4 text-center text-2xl">Let's Learn Together!</h1>
      <h2 class="text-center mb-3">Join the Elixir Newbie Discord. We run weekly group coding sessions. Join us to learn Elixir in a hands-on, practical environment.</h2>
      <h2 class="text-center mb-6">Our next meeting is at <strong> <%= next_saturday(Date.utc_today()) %> </strong> at 9:30am PT </h2>
      <article class="flex items-center justify-center sm:space-x-12">
          <figure class="aspect-square lg:w-1/4 sm:w-1/3 hidden sm:block">
            <img class="rounded-full border-t-4 border-l-4 border-white" src="images/hack-a-thing.jpg" alt="Picture resembling Brooklin Myers as a Wizard"/>
          </figure>
          <figure class="lg:w-1/4 sm:w-2/5 w-3/4">
            <p>We call it the hack-a-thing: every Saturday we get together, think something up, and code it.</p>
            <hr class="my-4"/>
            <p>This is a great opportunity for learning (no matter your level) and for meeting other Elixir enthusiasts.</p>
            <a href="https://discord.gg/XBAAmuZGXU" class="block text-black bg-white p-2 w-full rounded-lg mt-6 text-center">Join our Discord</a>
          </figure>
      </article>
    </section>
    """
  end

  def next_saturday(today) do
    Date.end_of_week(today, :sunday) |> Calendar.strftime("%A, %B %d")
  end

end
