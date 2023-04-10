defmodule ElixirNewbieWeb.BlogLive do
  @moduledoc """
  Display a list os Blog posts
  """
  use ElixirNewbieWeb, :live_view
  import ElixirNewbieWeb.Components.BlogCard
  import ElixirNewbieWeb.Components.ResponsiveLayout
  alias ElixirNewbie.Blog

  def render(assigns) do
    ~H"""
    <section class="bg-[url('/images/BlogBackground.webp')] min-h-screen bg-repeat">
      <div class="to-black/40 bg-gradient-to-t from-black">
        <.navigation/>
        <section class="mx-auto flex h-fit w-full flex-col gap-12 4k:gap-36 sm:w-full md:w-3/4 lg:w-full lg:flex-row xl:w-3/4 xl:gap-24">
          <div>
            <article class="animate-fade-in grid h-fit w-full grid-cols-5 grid-rows-6">
              <article class="aspect-square relative col-start-1 col-end-6 row-start-1 row-end-6 rounded-full border-4 border-white">
                <img
                  class="rounded-full"
                  alt="blog page icon of a wizard reading a book"
                  src="images/blog_list_icon.webp"
                />
              </article>
            </article>
            <div class="grid grid-cols-5 gap-4 px-2">
              <.form id="search" phx-change="filter" phx-submit="scroll" phx-hook="ScrollOnSubmit" phx-data-value="all_blogs" class="col-span-4 grid h-fit w-full" autocomplete="off" for={%{}}>
                  <div class="flex items-center rounded-xl rounded-full px-8 text-center text-sm font-semibold ring-2 ring-white transition duration-500 ease-in-out hover:ring-offset-2">
                    <Heroicons.magnifying_glass mini class="h-6 w-6 text-white"/>
                    <input name="search" id="search-blogs" errors={[]} class="h-8 w-0 flex-grow bg-transparent p-4 py-8 text-white placeholder-gray-400 outline-none focus-within:text-secondary" value={@search}/>
                    <p class="text-white"><%= length(@blogs) %></p>
                  </div>
              </.form>
              <.button id="see_results" phx-hook="ScrollOnClick" class="cursor-pointer rounded-xl rounded-full rounded-full bg-transparent text-center text-center text-sm font-semibold ring-2 ring-white transition duration-500 ease-in-out hover:bg-transparent hover:ring-offset-2" phx-data-value="all_blogs" >
                <Heroicons.arrow_down class="inline h-8 w-8"/>
              </.button>
            </div>
          </div>
          <article class="flex w-full flex-col px-2 text-2xl text-white 4k:text-4xl lg:text-2xl">
            <h1>Here, open my scroll. Don’t worry, it has a friendly and approachable tone. Plus it’s searchable...</h1>
            <.responsive_layout class="mt-1" scroll_id="tags" cols={3} spacing="none" gap="tiny">
              <%= for tag <- @tags do %>
                <button phx-click="toggle-tag" phx-value-tag={tag} class={
                  "text-sm font-semibold text-center rounded-xl transition duration-500 ease-in-out ring-2 ring-white hover:ring-offset-2 flex justify-center items-center cursor-pointer
                  #{if Enum.member?(@selected_tags, tag) do "bg-purple-800/70" end}"}>
                  <span class="inline-block align-middle">
                    <%= String.replace(tag, "_", " ") %>
                  </span>
                </button>
              <% end %>
            </.responsive_layout>
          </article>
        </section>
      <.responsive_layout class="mt-12" scroll_id="all_blogs" cols={3} spacing="full">
        <%= for blog <- @blogs do %>
          <.blog_card blog={blog} />
        <% end %>
      </.responsive_layout>
      </div>
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

    socket
    |> assign(
      :blogs,
      Blog.posts_and_drafts()
      |> Blog.filter_posts(title: search, selected_tags: selected_tags)
    )
  end
end
