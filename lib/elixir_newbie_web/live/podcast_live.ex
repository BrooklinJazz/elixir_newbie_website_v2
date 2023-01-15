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
      <article id="current-episode" class="text-white w-2/3 flex flex-col">
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
    <section class="podcast-description text-white mt-12">
        <%= raw @current_episode.description %>
    </section>
    <section class="mt-10 grid grid-cols-4 text-white mt-12">
      <.platform href={"https://podcasts.apple.com/us/podcast/elixir-newbie/id1587455457"} src="images/apple_podcasts_icon.webp" alt="Apple Podcasts"/>
      <.platform href={"https://podcasts.google.com/feed/aHR0cHM6Ly9mZWVkcy5idXp6c3Byb3V0LmNvbS8xODQwMzgxLnJzcw=="} src="images/google_podcasts_icon.webp" alt="Google Podcasts"/>
      <.platform href={"https://open.spotify.com/show/2VNf2tvHIjSxTXMY15qtdV"} src="images/spotify_icon.webp" alt="Spotify"/>
      <.platform href={"https://feeds.buzzsprout.com/1840381.rss"} src="images/rss_icon.webp" alt="RSS"/>
    </section>
    <%!-- hosts goes here --%>
    <section>
      <h2 class="text-3xl text-white mt-12">Want more? Here's the ancient archives.</h2>
      <%= for episode <- @episodes do %>
        <%!-- using navigate instead of page to send user to the top of the page --%>
        <%!-- it would be better to nicely send the user to the top of the page to avoid reloading data --%>
        <.link id={"podcast-episode-#{episode.episode_number}"} patch={~p"/podcast?episode=#{episode.episode_number}"}>
          <figure class="relative mt-6 rounded-3xl ring ring-white transition duration-500 ease-in-out hover:ring-offset-2">
            <figcaption class="absolute flex h-full w-full items-center justify-between px-16 text-2xl text-white">
              <p><%= episode.title %></p>
              <p><%= episode.hh_mm_ss %></p>
            </figcaption>
            <img class="w-full rounded-3xl" alt="Blog" src={"images/wavy_background_cropped_7-1.png"}/>
          </figure>
        </.link>
      <% end %>
    </section>
    """
  end

  def audio_player(assigns) do
    ~H"""
      <figure>
        <audio id="player" class="" controls>
          <source src={@src} type="audio/mpeg">
          Your browser does not support the audio element.
        </audio>
      </figure>
    """
  end
  # Examples for custom audio player buttons
  # <a href={@src} target="_blank" download>download audio</a>
  # <button onclick="document.getElementById('player').play()">Play</button>
  # <button onclick="document.getElementById('player').pause()">Pause</button>
  # <button onclick="document.getElementById('player').volume += 0.1">Vol +</button>
  # <button onclick="document.getElementById('player').volume = 1">Vol -</button>
  # <input oninput="document.getElementById('player').volume = this.value" type="range" id="volume" name="volume" min="0" max="1" step="0.1"/>
  # <button onclick="document.getElementById('player').volume = 0">Mute</button>
  # <button onclick="document.getElementById('player').playbackRate = 1">Speed 1</button>
  # <button onclick="document.getElementById('player').playbackRate = 2">Speed 2</button>

  def platform(assigns) do
    ~H"""
      <.link
        href={@href}
        class="group"
      >
      <figure class="flex h-24 items-center justify-center space-x-3 hover:cursor-pointer">
        <img class="h-full rounded-full transition duration-300 ease-in-out group-hover:scale-110" src={@src} alt={@alt}>
        <figcaption>RSS</figcaption>
      </figure>
      </.link>
    """
  end
end
