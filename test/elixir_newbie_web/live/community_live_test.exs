defmodule ElixirNewbieWeb.DiscordLiveTest do
  use ElixirNewbieWeb.ConnCase
  doctest ElixirNewbieWeb.DiscordLive
  alias ElixirNewbieWeb.DiscordLive

  test "connected mount", %{conn: conn} do
    assert {:ok, _view, html} = live(conn, ~p"/discord")
    assert html =~ "Let&#39;s Learn Together!"
  end

  test "next_saturday/1" do
    today = ~D[2023-02-19]
    expected = "Saturday, February 25"
    assert DiscordLive.next_saturday(today) == expected
  end

  test "next_saturday/1 wrap around month" do
    today = ~D[2023-02-28]
    expected = "Saturday, March 04"
    assert DiscordLive.next_saturday(today) == expected
  end

  test "next_saturday/1 wrap around year" do
    today = ~D[2023-12-31]
    expected = "Saturday, January 06"
    assert DiscordLive.next_saturday(today) == expected
  end
end
