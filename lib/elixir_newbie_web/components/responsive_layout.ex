defmodule ElixirNewbieWeb.Components.ResponsiveLayout do
  @moduledoc """
  Creates a consistent responsive layout
  """
  use ElixirNewbieWeb, :html

  attr(:class, :string)
  attr(:scroll_id, :string)
  attr(:spacing, :string, values: ["full", "narrow", "none"], default: "narrow")
  attr(:gap, :string, values: ["none", "tiny", "small", "large"], default: "small")
  attr(:cols, :integer, values: [2, 3, 4])
  slot(:inner_block, required: true)

  def responsive_layout(assigns) do
    ~H"""
    <section
      data-scroll-id={@scroll_id}
      class={[
        "grid min-h-full py-12",
        @class,
        @spacing === "narrow" && "px-12 md:px-24 xl:px-60",
        @spacing === "full" && "px-6 md:px-8 xl:px-12",
        @cols === 2 && "sm:grid-cols-1 lg:grid-cols-2 sm:grid-rows-2 lg:grid-rows-1",
        @cols === 3 && "grid lg:grid-cols-3 md:grid-cols-2 xs:grid-cols-1",
        @cols === 4 && "grid w-full min-h-full sm:grid-cols-1 xl:grid-cols-4 lg:grid-cols-2",
        @gap === "large" && "gap-24",
        @gap === "small" && "gap-12",
        @gap === "tiny" && "gap-6"
      ]}
    >
      <%= render_slot(@inner_block) %>
    </section>
    """
  end
end
