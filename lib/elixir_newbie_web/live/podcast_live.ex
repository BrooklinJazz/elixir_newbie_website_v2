defmodule ElixirNewbieWeb.PodcastLive do
  use ElixirNewbieWeb, :live_view
  use Phoenix.Component
  alias ElixirNewbie.Podcast
  alias ElixirNewbie.Podcast.Formatter

  @content_width "w-full p-2 sm:w-11/12 md:w-4/5 m-auto"
  @button_hover "transition duration-300 hover:text-purple-500"

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     assign(socket,
       episodes: Podcast.all_episodes(),
       play_speed: 1,
       volume: 1,
       muted: false,
       content_width: @content_width,
       button_hover: @button_hover
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
  def handle_params(_params, _session, socket) do
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
    <section class="bg-[url('/images/PodcastBackground.webp')] bg-top min-h-screen bg-repeat">
      <div class="w-full h-full bg-black/50">
        <.navigation/>
        <section class={[@content_width, "text-white"]}>
          <h1 class="mb-4 text-center text-2xl"><%= @current_episode.title %></h1>
          <article class="flex items-center justify-center sm:gap-x-12">
            <figure class="aspect-square hidden sm:block sm:w-1/3 lg:w-1/4">
              <img class="rounded-full border-t-4 border-l-4 border-white" src="images/podcast_brooklin.webp" alt="Picture resembling Brooklin Myers as a Wizard"/>
            </figure>
            <figure class="w-full p-2 sm:w-1/2 lg:w-2/5 text-xl">
              <p>Elixir Newbie is a podcast dedicated to helping and encouraging new and transitioning developers to adopt Elixir.</p>
              <hr class="my-4"/>
              <p>Brooklin Myers and Co-host Jon Valdivia speak with guests from the industry. You'll learn something new, and have fun too.</p>
            </figure>
          </article>
          <.audio_player {assigns} />
        </section>
        <section class={[@content_width, "podcast-description text-white"]}>
          <%= raw @current_episode.description %>
        </section>
        <section class={[@content_width, "mt-10 flex justify-between text-white"]}>
          <.platform href={"https://podcasts.apple.com/us/podcast/elixir-newbie/id1587455457"} src="images/ApplePodcastsIcon.webp" alt="Apple Podcasts"/>
          <.platform href={"https://podcasts.google.com/feed/aHR0cHM6Ly9mZWVkcy5idXp6c3Byb3V0LmNvbS8xODQwMzgxLnJzcw=="} src="images/GooglePodcastsIcon.webp" alt="Google Podcasts"/>
          <.platform href={"https://open.spotify.com/show/2VNf2tvHIjSxTXMY15qtdV"} src="images/SpotifyIcon.webp" alt="Spotify"/>
          <.platform href={"https://feeds.buzzsprout.com/1840381.rss"} src="images/RSSIcon.webp" alt="RSS"/>
        </section>
        <section class={@content_width}>
          <h2 class="mt-12 text-3xl text-white">Want more? Here's the ancient archives.</h2>
          <%= for episode <- @episodes do %>
            <.episode_button episode={episode}/>
          <% end %>
        </section>
      </div>
    </section>
    """
  end

  def audio_player(assigns) do
    ~H"""
    <article class="m-6 flex gap-x-4 justify-center items-center">
      <p id="player-current-time">0:00</p>
      <div id="player-progress" phx-hook="Progress" class="h-3 rounded-xl overflow-hidden bg-gray-100 hover:cursor-pointer w-2/3 lg:w-2/3">
        <div id="player-progress-fill" class="h-full rounded-l-full bg-gray-400 w-0" />
      </div>
      <p id="player-total-time"><%= @current_episode.hh_mm_ss %></p>
    </article>
    <article class="flex sm:gap-x-2 md:gap-x-4 justify-center xl:justify-between">
      <audio class="hidden" src={@current_episode.audio_url} id="player" phx-hook="AudioPlayer" controls>
        Your browser does not support the audio element.
      </audio>
      <section class="flex w-1/3 justify-center items-center hidden xl:flex">
        <a
          href={@current_episode.audio_url}
          target="_blank"
          download
          aria-label="Download Podcast Episode"
          class={@button_hover}
        >
          <Heroicons.arrow_down_tray class="h-6 w-6"/>
        </a>
      </section>
      <section class="flex w-full sm:w-1/3 justify-between sm:justify-around sm:gap-x-8">
        <.link aria-label="previous episode" class={[
          "flex items-center justify-center gap-x-2 sm:gap-x-6",
          @button_hover
        ]}
        :if={@prev} patch={~p"/podcast?episode=#{@prev}"}
        >
          <Heroicons.arrow_left_circle class="h-6" />
          <p class="whitespace-nowrap">Ep. <%= @prev %></p>
        </.link>
        <button class={@button_hover} phx-click="backward" id="player-backward" aria-label="skip back 15 seconds" ><Heroicons.backward class="h-12 w-12"/></button>
        <button class={@button_hover} phx-click="play" id="player-play" :if={!@playing} aria-label="play"><Heroicons.play class="h-12 w-12" solid/></button>
        <button class={@button_hover} phx-click="pause" id="player-pause" :if={@playing} aria-label="pause"><Heroicons.pause class="h-12 w-12"/></button>
        <button class={@button_hover} phx-click="forward" id="player-forward" aria-label="forward"><Heroicons.forward class="h-12 w-12"/></button>
        <.link aria-label="next episode"
        class={[
          "flex items-center justify-center gap-x-2 sm:gap-x-6",
          @button_hover
        ]}
        :if={@next} patch={~p"/podcast?episode=#{@next}"}
        >
          <p class="whitespace-nowrap">Ep. <%= @next %></p>
          <Heroicons.arrow_right_circle class="h-6" />
        </.link>
      </section>
      <section class="ml-auto hidden xl:flex gap-x-8 justify-center items-center">
        <button
          id="player-playback-rate"
          phx-click="toggle-speed"
          class={[@button_hover, "hidden text-center text-xl lg:block"]}
        >
          <%= @play_speed %>x
        </button>
        <.form class="hidden items-center justify-center md:flex" phx-change="set-volume" for={%{}}>
          <Heroicons.speaker_x_mark id="player-speaker-x-mark" phx-click="toggle_mute" :if={@muted} class="h-6 w-6 cursor-pointer" />
          <Heroicons.speaker_wave id="player-speaker-wave" phx-click="toggle_mute" :if={not @muted} class="h-6 w-6 cursor-pointer" />
          <input
            id="player-volume"
            phx-change="set-volume"
            type="range"
            name="volume"
            min="0"
            max="1"
            step="0.1"
            value={@volume}
            aria-label="podcast volume control"
            class="w-2/3"
          />
        </.form>
      </section>
    </article>
    """
  end

  def episode_button(assigns) do
    ~H"""
    <.link class="h-max min-h-[8rem] gap-x-6 bg-black/80 mt-6 rounded-3xl ring ring-white transition duration-500 ease-in-out hover:ring-offset-2 block flex h-full w-full items-center justify-between p-2 sm:px-16 sm:py-8 text-2xl text-white" phx-hook="ScrollToTop" id={"podcast-episode-#{@episode.episode_number}"} patch={~p"/podcast?episode=#{@episode.episode_number}"}>
      <p><%= @episode.title %></p>
      <p class="hidden sm:block"><%= @episode.hh_mm_ss %></p>
    </.link>
    """
  end

  def platform(assigns) do
    ~H"""
      <.link
        href={@href}
        target="_blank"
        class="group flex flex-col items-center justify-center hover:cursor-pointer"
      >
        <img class="rounded-full w-24 h-24 transition duration-300 ease-in-out group-hover:scale-110" src={@src} alt={@alt}>
        <figcaption class="text-center"><%= @alt %></figcaption>
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
    {volume, _} = Float.parse(volume)

    {:noreply, socket |> assign(:volume, volume) |> push_event("set-volume", %{volume: volume})}
  end

  @impl true
  def handle_event("toggle_mute", _params, socket) do
    {:noreply, socket |> assign(:muted, !socket.assigns.muted) |> push_event("toggle-mute", %{})}
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

  defp progress_percent(playing, player_time, total_time) do
    minimum = if playing, do: 2, else: 0
    max(round(player_time / total_time * 100), minimum)
  end
end
