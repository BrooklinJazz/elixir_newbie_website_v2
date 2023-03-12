defmodule ElixirNewbieWeb.ResponsiveDesignTests do
  use ExUnit.Case, async: true
  use Wallaby.Feature

  feature "wallaby starts", %{session: session} do
    session
    |> IO.inspect()
    |> visit("http://localhost:4000/")
  end
end
