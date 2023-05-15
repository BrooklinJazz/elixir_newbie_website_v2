defmodule ElixirNewbieWeb.BlogShow do
  use ElixirNewbieWeb, :live_view
  alias ElixirNewbie.Blog
  alias ElixirNewbie.Blog.Post
  import ElixirNewbieWeb.Components.BlogCard
  import ElixirNewbieWeb.Components.ResponsiveLayout

  def render(assigns) do
    ~H"""
     <section class="bg-[url('/images/BlogBackground.webp')] min-h-screen bg-repeat text-white">
      <div class="to-black/60 bg-gradient-to-t from-black">
        <.navigation/>
        <section class="mx-auto w-2/3 pb-24">
          <h1 class="mb-10 block rounded-lg text-4xl hover:opacity-75"><%= @blog.title%></h1>
          <p class="mb-6 text-2xl"><%= raw @blog.description %></p>
          <p class="text-l mb-6">By <%= raw @blog.author_name %>. Written on <%= Date.to_string(@blog.date) %> </p>
          <img class="mb-4 w-full rounded-2xl" src={"/images/posts/#{@blog.cover_image}"}/>
          <%= if @blog.livebook_url do %>
           <a href={@blog.livebook_url}>
             <img src="https://livebook.dev/badge/v1/black.svg" alt="Run in Livebook" />
           </a>
          <% end %>
          <div class="markdown">
            <%= raw @blog.body %>
          </div>
        </section>
      </div>
    </section>
    """
  end

  def mount(%{"id" => id}, _session, socket) do
    blog = ElixirNewbie.Blog.get_post_by_id!(Blog.posts_and_drafts(), id)

    {:ok,
     assign(socket,
       page_title: blog.title,
       blog: blog,
       loading: !connected?(socket)
     )}
  end
end
