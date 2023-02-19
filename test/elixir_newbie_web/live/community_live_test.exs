defmodule ElixirNewbieWeb.CommunityLiveTest do
  use ElixirNewbieWeb.ConnCase
	doctest ElixirNewbieWeb.CommunityLive
	alias ElixirNewbieWeb.CommunityLive

  test "connected mount", %{conn: conn} do
    assert {:ok, _view, html} = live(conn, ~p"/community")
    assert html =~ "Let&#39;s Learn Together!"
  end

	test "next_saturday/1" do
		today = ~D[2023-02-19]
		expected = "Saturday, February 25"
		assert CommunityLive.next_saturday(today) == expected
	end

	test "next_saturday/1 wrap around month" do
		today = ~D[2023-02-28]
		expected = "Saturday, March 04"
		assert CommunityLive.next_saturday(today) == expected
	end

	test "next_saturday/1 wrap around year" do
		today = ~D[2023-12-31]
		expected = "Saturday, January 06"
		assert CommunityLive.next_saturday(today) == expected
	end
end
