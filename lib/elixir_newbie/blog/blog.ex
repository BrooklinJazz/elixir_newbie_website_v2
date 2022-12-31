defmodule ElixirNewbie.Blog do
  alias ElixirNewbie.Blog.Post

  use NimblePublisher,
    build: Post,
    from: Application.app_dir(:elixir_newbie, "priv/posts/**/*.md"),
    as: :posts,
    highlighters: [:makeup_elixir, :makeup_erlang]

  # And finally export them
  def all_posts, do: @posts
end
