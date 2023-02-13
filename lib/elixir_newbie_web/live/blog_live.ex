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
        <div>
          <article class="grid h-fit w-full grid-cols-6 grid-rows-6 animate-fade-in">
            <article class="aspect-square relative col-start-1 col-end-6 row-start-1 row-end-6 rounded-full border-4 border-white">
              <img
                class="rounded-full"
                alt="blog page icon of a wizard reading a book"
                src="images/blog_list_icon.webp"
              />
            </article>
          </article>
          <div class="grid grid-cols-5 gap-4">
            <.form id="search" for={:filter} phx-change="filter" phx-submit="scroll" phx-hook="ScrollOnSubmit" phx-data-value="all_blogs" class="grid h-fit w-full col-span-4" autocomplete="off">
                <div class="flex items-center px-8 rounded-full text-sm font-semibold text-center rounded-xl transition duration-500 ease-in-out ring-2 ring-white hover:ring-offset-2">
                  <Heroicons.magnifying_glass mini class="h-6 w-6 text-white"/>
                  <input name="search" id="search-blogs" errors={[]} class="flex-grow w-0 h-8 p-4 py-8 text-white placeholder-gray-400 bg-transparent outline-none focus-within:text-secondary" value={@search}/>
                  <p class="text-white"><%= length(@blogs) %></p>
                </div>
            </.form>
            <.button id="see_results" phx-hook="ScrollOnClick" class="text-center rounded-full cursor-pointer rounded-full text-sm font-semibold text-center rounded-xl transition duration-500 ease-in-out ring-2 ring-white hover:ring-offset-2 bg-transparent hover:bg-transparent" phx-data-value="all_blogs" >
              <Heroicons.arrow_down class="h-8 w-8 inline"/>
            </.button>
          </div>
        </div>
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

  def handle_event("filter", %{"_target" => ["search"], "search" => search}, socket) do
    {:noreply, socket |> assign(:search, search) |> load_blogs()}
  end

  def handle_event("scroll", _params, socket) do
    {:noreply, socket}
  end

  def load_blogs(socket) do
    %{search: search, selected_tags: selected_tags} = socket.assigns
    socket |> assign(:blogs,
      Blog.posts_and_drafts()
      |> Blog.filter_posts(title: search, selected_tags: selected_tags)
      )
  end
end
