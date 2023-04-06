defmodule ElixirNewbie.Blog do
  @moduledoc """
  Blog Context
  """
  alias ElixirNewbie.Blog.BlogParser

  defmodule NotFoundError do
    defexception [:message, plug_status: 404]
  end

  def posts_and_drafts, do: BlogParser.posts_and_drafts()

  def all_tags, do: BlogParser.all_tags()

  def filter_posts(posts, filters \\ []) do
    Enum.reduce(filters, posts, fn
      {:title, value}, acc ->
        Enum.filter(acc, fn post ->
          String.contains?(String.downcase(post.title), String.downcase(value))
        end)

      {:selected_tags, []}, acc ->
        acc

      {:selected_tags, tags}, acc ->
        Enum.filter(acc, fn post -> common_in_list?(tags, post.tags) end)

      _, acc ->
        acc
    end)
    |> remove_drafts()
  end

  def get_post_by_id!(posts, id) do
    Enum.find(posts, &(&1.id == id)) ||
      raise NotFoundError, "post with id=#{id} not found"
  end

  defp remove_drafts(posts) do
    Enum.filter(posts, fn each ->
      Date.compare(each.date, Date.utc_today()) in [:lt, :eq]
    end)
  end

  defp common_in_list?(list_a, list_b) do
    Enum.any?(list_a, fn each -> each in list_b end)
  end
end
