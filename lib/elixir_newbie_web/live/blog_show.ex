defmodule ElixirNewbieWeb.BlogShow do
  use ElixirNewbieWeb, :live_view
  alias ElixirNewbie.Blog
  alias ElixirNewbie.Stats
  alias ElixirNewbie.Blog.Post
  ## alias ElixirNewbie.Router.Helpers, as: Routes ##


  def render(assigns) do ## BigSpaces Wonders... about embedding the  {/if}  <figure class="makeup-blog"> as in v1
    ~H"""
     <section class="bg-[url('/images/BlogBackground.webp')] min-h-screen bg-repeat text-white">
      <div class="to-black/60 bg-gradient-to-t from-black">
        <.navigation/>


      <section class="mx-auto w-2/3 pb-24">
        <h1 class="mb-10 block rounded-lg text-4xl hover:opacity-75"><%= raw @blog.title%></h1>
        <p class="mb-6 text-2xl"><%= raw @blog.description %></p>
        <p class="mb-6 text-l">By <%= raw @blog.author_name %>. Written on <%= Date.to_string(@blog.date) %> </p>
        <img class="mb-4 rounded-2xl" src={"/images/posts/#{@blog.cover_image}"}/>
        <%!-- {#if @blog.livebook_url}
        <a href={@blog.livebook_url}>
          <img src="https://livebook.dev/badge/v1/black.svg" alt="Run in Livebook" />
        </a>
        {/if} --%>
        <div class="markdown">
          <%= raw @blog.body%>
        </div>
      </section>
      </div>
      <%!-- <section class={"my-24"}>
        <CardContainer>
          {#for blog <- @highlighted_blogs}
            <BlogCard blog={blog}/>
          {/for}
        </CardContainer>
        <IconButton click="to_blog" class="mt-12 ml-16" rounded={true} icon={:left_arrow}>Back to All Blogs</IconButton>
      </section> --%>



    </section>
    """
  end

  def mount(%{"id" => id}, _session, socket) do

   blog = ElixirNewbie.Blog.get_post_by_id!(Blog.posts_and_drafts(), id) ## BigSpaces Sherlock Mode: Refactor or re-think this. Are we passing ALL of the posts?
   IO.inspect(blog, label: "POSSSST")
    #path = Path.basename(id, ".md")
    path = "priv/posts/blog/2022/01-14-writing-tests-in-livebook.md"
    #Blog. |> IO.inspect(label: "POSSSST")

    {:ok,
    assign(socket,
      page_title: blog.title,
      blog: blog,
      #highlighted_blogs: Blog.highlighted_posts(blog.id, 6),
      loading: !connected?(socket)
    )}
  end
end
