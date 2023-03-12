defmodule ElixirNewbieWeb.Components.Tag do
  use ElixirNewbieWeb, :html

  attr(:text, :string, required: true)
  attr(:selected, :boolean, default: false)

  def tag(assigns) do
    ~H"""
    <div phx-click="toggle-tag" phx-value-tag={@text} class={
      "text-sm font-semibold text-center rounded-xl transition duration-500 ease-in-out ring-2 ring-white hover:ring-offset-2 flex justify-center items-center cursor-pointer
      #{if @selected do ' bg-purple-800/70' end}"}>
      <span class="inline-block align-middle">
        <%= String.replace(@text, "_", " ") %>
      </span>
    </div>
    """
  end
end
