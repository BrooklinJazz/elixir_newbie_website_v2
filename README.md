# ElixirNewbie

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix

## Wallaby

We use [Wallaby](https://github.com/elixir-wallaby/wallaby) for end-to-end testing. If you want to run Wallaby you'll have to follow their instructions and install the ChromeDriver.

To execute wallaby tests run:

```elixir
mix test --only wallaby
```

For example, we have a `/screenshots` folder with screenshots of every page at different screen sizes in order to ensure consistent responsive styles across devices.

## Webp Conversion

We use .webp images for performance optimization. We can convert an image to .web using the webp library

```
$ sudo apt install webp 
```

Then simply convert the image.

```elixir
$ cwebp -q 60 my_image.png -o my_image.webp
```