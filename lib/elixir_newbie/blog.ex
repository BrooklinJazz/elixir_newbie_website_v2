defmodule ElixirNewbie.Blog do
  alias ElixirNewbie.Blog.Post

  use NimblePublisher,
    build: Post,
    from: Application.app_dir(:elixir_newbie, "priv/posts/blog/**/*.md"),
    as: :posts,
    highlighters: [:makeup_elixir, :makeup_erlang]

  @posts Enum.sort_by(@posts, & &1.date, {:desc, Date})

  @tags @posts |> Enum.flat_map(& &1.tags) |> Enum.uniq() |> Enum.sort()

  defmodule NotFoundError do
    defexception [:message, plug_status: 404]
  end

  def posts_and_drafts, do: @posts

  def all_tags, do: @tags

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
