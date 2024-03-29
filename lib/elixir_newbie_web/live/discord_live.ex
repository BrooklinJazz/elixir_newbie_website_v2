defmodule ElixirNewbieWeb.DiscordLive do
  use ElixirNewbieWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <section class="sm:bg-[url('/images/DiscordBackground.png')] h-screen bg-cover min-h-screen text-white w-screen bg-no-repeat">
    <div class="from-black/90 to-black/25 h-screen w-full bg-gradient-to-t">
      <.navigation/>
      <section class="p-8">
        <h1 class="mb-4 text-center text-2xl 4k:mb-16 4k:text-6xl 2xl:text-3xl">Let's Learn Together!</h1>
        <h2 class="mb-3 text-center text-xl 4k:mb-20 4k:text-3xl">Join the Elixir Newbie Discord. We run weekly group coding sessions.
        <br/>Join us to learn Elixir in a hands-on, practical environment.</h2>
        <h2 class="mb-6 text-center text-sm text-xl 4k:mb-24 4k:text-4xl">Our next meeting is at <strong> <%= next_saturday(Date.utc_today()) %> </strong> at 9:30am PT </h2>
        <article class="flex items-center justify-center sm:space-x-12">
            <figure class="aspect-square hidden 4k:w-1/5 sm:block sm:w-1/3 lg:w-1/4">
              <img class="rounded-full border-t-4 border-l-4 border-white" src="images/hack-a-thing.jpg" alt="Picture resembling Brooklin Myers as a Wizard"/>
            </figure>
            <figure class="w-3/4 rounded-lg p-6 4k:w-1/5 sm:w-2/5 lg:w-1/4">
                <p class="text-xl 4k:text-3xl">We call it the hack-a-thing: every Saturday we get together, think something up, and code it.</p>
                <hr class="my-4"/>
                <p class="text-xl 4k:text-3xl">This is a great opportunity for learning (no matter your level) and for meeting other Elixir enthusiasts.</p>
                <a
                  href="https://discord.gg/XBAAmuZGXU"
                  class={[
                    "mt-6 block w-full rounded-lg p-2 text-center text-xl text-white 4k:text-3xl",
                    "transition duration-500 ease-in-out ring ring-white hover:ring-offset-2"
                  ]}
                >
                Join our Discord
                </a>
            </figure>
        </article>
      </section>
    </div>
    </section>
    """
  end

  def next_saturday(today) do
    Date.end_of_week(today, :sunday) |> Calendar.strftime("%A, %B %d")
  end
end
