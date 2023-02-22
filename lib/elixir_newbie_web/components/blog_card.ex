defmodule ElixirNewbieWeb.Components.BlogCard do
  use ElixirNewbieWeb, :html

  attr(:blog, :map, required: true)

  def blog_card(assigns) do
    ~H"""
      <article>
        <figure class="overflow-hidden h-90 rounded-3xl aspect-[2/1] transition duration-500 ease-in-out ring-2 ring-white hover:ring-offset-2">
          <img class="w-auto rounded-lg" src={static_url(ElixirNewbieWeb.Endpoint, "/images/posts/#{@blog.cover_image}")}/>
        </figure>
        <p class="mt-2 text-2xl text-white 4k:text-4xl lg:text-2xl"><%= @blog.title %></p>
        <p class="text-lg text-white 4k:text-2lg lg:text-lg"><%= @blog.description %></p>
        <p class="mt-2 text-gray-300">
          <%= Calendar.strftime(NaiveDateTime.new!(@blog.date, Time.utc_now()), "%B %d %Y") %>
          <span class="float-right"><%= @blog.author_name %></span>
        </p>
      </article>
    """
  end
end
