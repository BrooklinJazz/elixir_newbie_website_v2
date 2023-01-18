defmodule ElixirNewbieWeb.PodcastLive do
  use ElixirNewbieWeb, :live_view
  alias ElixirNewbie.Podcast
  alias ElixirNewbie.Podcast.Formatter

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     assign(socket,
       episodes: Podcast.all_episodes(),
       play_speed: 1,
       volume: 1
     )}
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
       prev: episode.episode_number != 1 && episode.episode_number - 1,
       player_time: 0,
       playing: false
     )}
  end

  @impl true
  def handle_params(params, _session, socket) do
    episode = Podcast.latest_episode()

    {:noreply,
     assign(socket,
       current_episode: episode,
       next: false,
       prev: episode.episode_number - 1,
       player_time: 0,
       playing: false
     )}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <section class="bg-[url('/images/podcast_background10.png')] bg-top min-h-screen bg-black bg-no-repeat bg-contain pb-96">
      <.navigation/>
      <section class="text-white w-full">
        <h1 class="text-center text-2xl mb-4"><%= @current_episode.title %></h1>
        <article class="flex items-center justify-center space-x-12">
          <figure class="aspect-square w-1/4">
            <img class="rounded-full  border-t-4 border-l-4 border-white" src="images/podcast_brooklin.png"/>
          </figure>
          <figure class="w-1/4">
            <p>Elixir Newbie is a podcast dedicated to helping and encouraging new and transitioning developers to adopt Elixir.</p>
            <hr class="my-4"/>
            Brooklin Myers and Co-host Jon Valdivia speak with guests from the industry. You'll learn something new, and have fun too.
          </figure>
          <%!-- <figure class="aspect-square w-1/4">
            <img class="rounded-full -scale-x-100" src="images/podcast_brooklin.png"/>
            <figcaption class="text-center">Jon Valdivia</figcaption>
          </figure> --%>
        </article>
        <article class="flex justify-center m-6">
          <div id="player-progress" phx-hook="Progress" class="h-3 w-1/2 bg-gray-100 rounded-xl hover:cursor-pointer">
            <div style={"width: #{progress_percent(@playing, @player_time, @current_episode.seconds)}%"} class="bg-gray-400 h-full rounded-l-full" />
          </div>
        </article>
        <article class="grid grid-cols-12">
          <audio class="hidden" src={@current_episode.audio_url} id="player" phx-hook="AudioPlayer" controls>
            Your browser does not support the audio element.
          </audio>
          <p id="player-time" class="col-start-3 h-12 flex items-center justify-center">
            <%= Formatter.to_hh_mm_ss(@player_time) %>/<%= @current_episode.hh_mm_ss %>
          </p>
          <a href={@current_episode.audio_url} target="_blank" download class="col-start-4 h-12 flex items-center justify-center"><Heroicons.arrow_down_tray class="h-6 w-6"/></a>
          <.link class="col-start-5 flex items-center justify-center space-x-2" :if={@prev} patch={~p"/podcast?episode=#{@prev}"} >
            <p>Ep. <%= @prev %></p>
            <Heroicons.arrow_left_circle class="h-6" />
          </.link>
          <article class="col-start-6 col-span-2 flex justify-around">
            <button phx-click="backward" id="player-backward"><Heroicons.backward class="h-12 w-12"/></button>
            <button phx-click="play" id="player-play" :if={!@playing}><Heroicons.play class="h-12 w-12" solid/></button>
            <button phx-click="pause" id="player-pause" :if={@playing}><Heroicons.pause class="h-12 w-12"/></button>
            <button phx-click="forward" id="player-forward"><Heroicons.forward class="h-12 w-12"/></button>
          </article>
          <.link class="col-start-8 flex items-center justify-center space-x-2" :if={@next} patch={~p"/podcast?episode=#{@next}"} >
            <Heroicons.arrow_right_circle class="h-6" />
            <p>Ep. <%= @next %></p>
          </.link>
          <button id="player-playback-rate" phx-click="toggle-speed" class="col-start-9 row-start-1 row-end-1 text-center text-xl"><%= @play_speed %>x</button>
          <div class="col-start-10 flex items-center justify-center space-x-2">
            <.form class="flex items-center justify-center space-x-2" phx-change="set-volume" for={:volume}>
              <Heroicons.speaker_x_mark id="player-speaker-x-mark" :if={@volume == 0} class="h-6 w-6" />
              <Heroicons.speaker_wave id="player-speaker-wave" :if={@volume > 0} class="h-6 w-6" />
              <input
                id="player-volume"
                phx-change="set-volume"
                type="range"
                name="volume"
                min="0"
                max="1"
                step="0.1"
                value={@volume}
              />
            </.form>
          </div>
        </article>
      </section>
      <section class="podcast-description mt-12 text-white m-auto w-3/4 bg-purple-500/50 text-white p-6 rounded-xl">
        <%= raw @current_episode.description %>
      </section>
      <section class="mt-10 grid grid-cols-4 text-white">
        <.platform href={"https://podcasts.apple.com/us/podcast/elixir-newbie/id1587455457"} src="images/apple_podcasts_icon.webp" alt="Apple Podcasts"/>
        <.platform href={"https://podcasts.google.com/feed/aHR0cHM6Ly9mZWVkcy5idXp6c3Byb3V0LmNvbS8xODQwMzgxLnJzcw=="} src="images/google_podcasts_icon.webp" alt="Google Podcasts"/>
        <.platform href={"https://open.spotify.com/show/2VNf2tvHIjSxTXMY15qtdV"} src="images/spotify_icon.webp" alt="Spotify"/>
        <.platform href={"https://feeds.buzzsprout.com/1840381.rss"} src="images/rss_icon.webp" alt="RSS"/>
      </section>
      <section class="w-3/4 m-auto">
        <h2 class="mt-12 text-3xl text-white">Want more? Here's the ancient archives.</h2>
        <%= for episode <- @episodes do %>
          <.link phx-hook="ScrollToTop" id={"podcast-episode-#{episode.episode_number}"} patch={~p"/podcast?episode=#{episode.episode_number}"}>
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
    </section>
    """
  end

  def platform(assigns) do
    ~H"""
      <.link
        href={@href}
        target="_blank"
        class="group"
      >
      <figure class="flex h-24 items-center justify-center space-x-3 hover:cursor-pointer">
        <img class="h-full rounded-full transition duration-300 ease-in-out group-hover:scale-110" src={@src} alt={@alt}>
        <figcaption><%= @alt %></figcaption>
      </figure>
      </.link>
    """
  end

  @impl true
  def handle_event("play", _params, socket) do
    {:noreply, socket |> assign(:playing, true) |> push_event("play", %{})}
  end

  @impl true
  def handle_event("pause", _params, socket) do
    {:noreply, socket |> assign(:playing, false) |> push_event("pause", %{})}
  end

  @impl true
  def handle_event("forward", _params, socket) do
    {:noreply, push_event(socket, "forward", %{})}
  end

  @impl true
  def handle_event("backward", _params, socket) do
    {:noreply, push_event(socket, "backward", %{})}
  end

  @impl true
  def handle_event("set-volume", %{"volume" => volume}, socket) do
    volume =
      case Float.parse(volume) do
        {volume, _} -> volume
        {:error, _} -> 0
      end

    {:noreply, socket |> assign(:volume, volume) |> push_event("set-volume", %{volume: volume})}
  end

  @impl true
  def handle_event("toggle-speed", _params, socket) do
    speed =
      case socket.assigns.play_speed do
        1 -> 1.5
        1.5 -> 2
        2 -> 2.5
        2.5 -> 3
        3 -> 1
      end

    {:noreply, socket |> assign(:play_speed, speed) |> push_event("set-speed", %{value: speed})}
  end

  @impl true
  def handle_event("time-update", %{"seconds" => seconds}, socket) do
    # it would be more responsive to handle this logic on the client, but so far it has not caused any issues.
    {:noreply, assign(socket, :player_time, seconds)}
  end

  defp progress_percent(playing, player_time, total_time) do
    minimum = if playing, do: 2, else: 0
    max(round(player_time / total_time * 100), minimum)
  end
end
