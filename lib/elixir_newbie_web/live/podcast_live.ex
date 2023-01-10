defmodule ElixirNewbieWeb.PodcastLive do
  use ElixirNewbieWeb, :live_view
  alias ElixirNewbie.Podcast

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :episodes, Podcast.all_episodes())}
  end

  @impl true
  def handle_params(%{"episode" => episode_number}, _session, socket) do
    episode =
      episode_number
      |> String.to_integer()
      |> Podcast.get!()

    {:noreply,
     assign(socket,
       current_episode: episode,
       next: episode.episode_number != Podcast.episode_count() && episode.episode_number + 1,
       prev: episode.episode_number != 1 && episode.episode_number - 1
     )}
  end

  @impl true
  def handle_params(_params, _session, socket) do
    episode = Podcast.latest_episode()

    {:noreply,
     assign(socket, current_episode: episode, next: false, prev: episode.episode_number - 1)}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <section class="flex space-x-10">
      <article class="w-1/3">
        <img class="aspect-square rounded-full" src="images/podcast_page_icon.webp"/>
      </article>
      <article class="text-white w-2/3 flex flex-col">
        <h1 class="text-3xl">Current Episode:</h1>
        <h2 class="mt-2 text-xl"><%=@current_episode.title %></h2>
        <article class="mt-auto">
          <.audio_player src={@current_episode.audio_url} />

          <%= if @prev do %>
            <.link patch={~p"/podcast?episode=#{@prev}"}>Prev</.link>
          <% end %>
          <%= if @next do %>
            <.link patch={~p"/podcast?episode=#{@next}"}>Next</.link>
          <% end %>
        </article>
      </article>
    </section>
    <section class="podcast-description text-white">
        <%= raw @current_episode.description %>
    </section>
    <section class="grid grid-cols-4 text-white mt-10">
      <.platform href={"https://podcasts.apple.com/us/podcast/elixir-newbie/id1587455457"} src="images/apple_podcasts_icon.webp" alt="Apple Podcasts"/>
      <.platform href={"https://podcasts.google.com/feed/aHR0cHM6Ly9mZWVkcy5idXp6c3Byb3V0LmNvbS8xODQwMzgxLnJzcw=="} src="images/google_podcasts_icon.webp" alt="Google Podcasts"/>
      <.platform href={"https://open.spotify.com/show/2VNf2tvHIjSxTXMY15qtdV"} src="images/spotify_icon.webp" alt="Spotify"/>
      <.platform href={"https://feeds.buzzsprout.com/1840381.rss"} src="images/rss_icon.webp" alt="RSS"/>
    </section>
    <%!-- hosts goes here --%>
    <section>
      <h2>Want more? Here's the ancient archives.</h2>
      <%= for episode <- @episodes do %>
        <%!-- using navigate instead of page to send user to the top of the page --%>
        <%!-- it would be better to nicely send the user to the top of the page to avoid reloading data --%>
        <.link navigate={~p"/podcast?episode=#{episode.episode_number}"}>
          <figure class="relative rounded-3xl transition duration-500 ease-in-out ring ring-white hover:ring-offset-2 mt-6">
            <figcaption class="absolute flex h-full w-full items-center justify-between text-white text-2xl px-16">
              <p><%= episode.title %></p>
              <p><%= to_hh_mm_ss(episode.duration) %></p>
            </figcaption>
            <img class="rounded-3xl w-full" alt="Blog" src={"images/wavy_background_cropped_7-1.png"}/>
          </figure>
        </.link>
      <% end %>
    </section>
    """
  end

  def audio_player(assigns) do
    ~H"""
      <figure>
        <audio class="my-4 w-full" controls>
          <source src={@src} type="audio/mpeg">
          Your browser does not support the audio element.
        </audio>
      </figure>
    """
  end

  def platform(assigns) do
    ~H"""
      <.link
        href={@href}
        class="group"
      >
      <figure class="hover:cursor-pointer flex h-24 items-center justify-center space-x-3">
        <img class="rounded-full h-full transition duration-300 ease-in-out group-hover:scale-110" src={@src} alt={@alt}>
        <figcaption>RSS</figcaption>
      </figure>
      </.link>
    """
  end

  @one_minute 60
  @one_hour 3600
  def to_hh_mm_ss(seconds) when seconds >= @one_hour do
    h = div(seconds, @one_hour)

    m =
      seconds
      |> rem(@one_hour)
      |> div(@one_minute)
      |> pad_int()

    s =
      seconds
      |> rem(@one_hour)
      |> rem(@one_minute)
      |> pad_int()

    "#{h}:#{m}:#{s}"
  end

  def to_hh_mm_ss(seconds) do
    m = div(seconds, @one_minute)

    s =
      seconds
      |> rem(@one_minute)
      |> pad_int()

    "#{m}:#{s}"
  end

  defp pad_int(int, padding \\ 2) do
    int
    |> Integer.to_string()
    |> String.pad_leading(padding, "0")
  end
end
