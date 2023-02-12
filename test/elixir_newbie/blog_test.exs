defmodule ElixirNewbie.BlogTest do
  use ExUnit.Case, async: true
  alias ElixirNewbie.Blog
  alias ElixirNewbie.Blog.Post

  describe "Posts filtering" do
    test "filter_posts/1 with no filters" do
      posts = [post1, post2, post3] = get_posts()

      assert Blog.filter_posts(posts) == [post1, post2, post3]
    end

    test "filter_posts/1 do not return draft posts" do
      # a draft post is any post ahead the current date
      draft = create_post([title: "Title", tags: ["tag"], date: ~D[9999-12-31]])

      posts = [post1, post2, post3] = get_posts()
      posts = [draft | posts]

      assert Blog.filter_posts(posts) == [post1, post2, post3]
    end

    test "filter_posts/2 filtering by search term" do
      posts = [_, post2, post3] = get_posts()

      assert Blog.filter_posts(posts, title: "Title2") == [post2, post3]
    end

    test "filter_posts/2 filtering by only one tag" do
      posts = [_, post2, post3] = get_posts()

      assert Blog.filter_posts(posts, selected_tags: ["tag2"]) == [post2, post3]
    end

    test "filter_posts/2 filtering by tags" do
      posts = [_, post2, post3] = get_posts()

      assert Blog.filter_posts(posts, selected_tags: ["tag2", "tag3"]) == [post2, post3]
    end
  end

  defp get_posts do
    [
      create_post([title: "Title", tags: ["tag"], date: ~D[2023-01-10]]),
      create_post([title: "Title2", tags: ["tag2"], date: ~D[2023-01-11]]),
      create_post([title: "title2 and more", tags: ["tag2", "tag3"], date: ~D[2023-01-12]])
    ]
  end

  defp create_post(attrs), do: struct(Post, attrs)
end
