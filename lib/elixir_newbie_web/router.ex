defmodule ElixirNewbieWeb.Router do
  use ElixirNewbieWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {ElixirNewbieWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ElixirNewbieWeb do
    pipe_through :browser
    # get "/", PageController, :home
    live "/", HomeLive, :home
    live "/blog", BlogLive, :blog
    live "/podcast", PodcastLive, :podcast
    live "/dockyard_academy", DockYardAcademyLive, :dockyard_academy
    live "/discord", DiscordLive, :discord
    live "/reading/:id", ContentLive, :reading
    live "/exercises/:id", ContentLive, :exercises
  end

  # Other scopes may use custom stacks.
  # scope "/api", ElixirNewbieWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:elixir_newbie, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: ElixirNewbieWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
