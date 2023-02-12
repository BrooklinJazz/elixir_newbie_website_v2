defmodule ElixirNewbieWeb.BlogLive do
  @moduledoc """
  Display a list os Blog posts
  """
  use ElixirNewbieWeb, :live_view
  import ElixirNewbieWeb.Components.BlogCard
  import ElixirNewbieWeb.Components.ResponsiveLayout
  import ElixirNewbieWeb.Components.Tag
  alias ElixirNewbie.Blog

  def render(assigns) do
    ~H"""
    <section class="bg-[url('/images/background-smoke-transparent.webp')] min-h-screen bg-black bg-no-repeat bg-contain">
      <.navigation/>
      <section class="flex h-fit w-full flex-col gap-12 4k:gap-36 lg:flex-row xl:gap-24 mx-auto sm:w-full md:w-3/4 lg:w-full xl:w-3/4">
        <article class="grid h-fit w-full grid-cols-6 grid-rows-6 animate-fade-in">
          <article class="aspect-square relative col-start-1 col-end-6 row-start-1 row-end-6 rounded-full border-4 border-white">
            <img
              class="rounded-full"
              alt="blog page icon of a wizard reading a book"
              src="images/blog_list_icon.webp"
            />
          </article>
        </article>
        <article class="flex w-full flex-col text-2xl text-white 4k:text-4xl lg:text-2xl">
          <h1>Here, open my scroll. Don’t worry, it has a friendly and approachable tone. Plus it’s searchable...</h1>
          <.responsive_layout class="mt-1" scroll_id="tags" cols={3} spacing="none" gap="tiny">
            <%= for tag <- @tags do %>
              <.tag text={tag} selected={Enum.member?(@selected_tags, tag)}/>
            <% end %>
          </.responsive_layout>
        </article>
      </section>
    <.responsive_layout class="mt-12" scroll_id="all_blogs" cols={3} spacing="full">
      <%= for blog <- @blogs do %>
        <.blog_card blog={blog} />
      <% end %>
    </.responsive_layout>
    </section>
    """
  end

  def mount(_params, _session, socket) do
    blogs =
      Blog.posts_and_drafts()
      |> Blog.filter_posts()

    tags = Blog.all_tags()

    {:ok,
     assign(socket,
       blogs: blogs,
       tags: tags,
       page_title: "Blog",
       selected_tags: [],
       selected_blog_on_mobile: false,
       active_blog: List.first(blogs),
       loading: !connected?(socket),
       search: ""
     )}
  end

  def handle_event("toggle-tag", %{"tag" => tag}, socket) do
    %{selected_tags: selected_tags} = socket.assigns

    selected_tags =
      if tag in selected_tags,
        do: Enum.reject(selected_tags, &(&1 === tag)),
        else: [tag | selected_tags]

    {:noreply,
     socket
     |> assign(:selected_tags, selected_tags)
     |> load_blogs()}
  end

  def load_blogs(socket) do
    %{search: search, selected_tags: selected_tags} = socket.assigns
    socket |> assign(:blogs,
      Blog.posts_and_drafts()
      |> Blog.filter_posts(title: search, selected_tags: selected_tags)
      )
  end
end
