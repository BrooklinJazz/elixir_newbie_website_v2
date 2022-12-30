defmodule ElixirNewbieWeb.HomeLiveTest do
  use ElixirNewbieWeb.ConnCase
  doctest ElixirNewbieWeb.HomeLive

  test "connected mount", %{conn: conn} do
    assert {:ok, _view, html} = live(conn, "/")
    assert html =~ "Brooklin"
  end
end
