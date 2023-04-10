defmodule ElixirNewbieWeb.ElixirNewbieComponents do
  @moduledoc """
  Provides Reusable Elixir Newbie UI components.
  """
  use Phoenix.Component
  import ElixirNewbieWeb.CoreComponents

  @doc """
  Renders page navigation
  """
  def navigation(assigns) do
    ~H"""
    <header class="mb-6 bg-gradient-to-r from-black to-transparent px-4 text-white sm:px-6 lg:px-8">
      <div class="flex items-center justify-between py-3">
        <div class={[
          "flex items-center gap-4 hidden sm:block",
          "transition duration-300 ease-in-out hover:scale-110"
        ]}>
          <.link navigate={"/"}>
            <img
              alt="Elixir Newbie Home Button"
              class="h-12"
              src="/images/elixir_newbie_logo_flat.webp"
            />
          </.link>
        </div>
        <div class="flex w-full justify-between text-2xl sm:w-fit sm:gap-12">
          <.link class="opacity-80 hover:opacity-100 sm:hidden" navigate={"/"}>Home</.link>
          <.link class="link-underline opacity-80 hover:opacity-100" navigate={"/blog"}>Blog</.link>
          <.link class="link-underline opacity-80 hover:opacity-100" navigate={"/podcast"}>
            Podcast
          </.link>
          <.link class="link-underline opacity-80 hover:opacity-100" navigate={"/dockyard_academy"}>
            DockYard Academy
          </.link>
          <.link class="link-underline opacity-80 hover:opacity-100" navigate={"/discord"}>
            Discord
          </.link>
        </div>
      </div>
      <hr class="animate-gradient-x h-1 w-full border-0 bg-gradient-to-r from-transparent via-orange-500 to-transparent opacity-70" />
    </header>
    """
  end
end
