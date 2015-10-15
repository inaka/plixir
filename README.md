# Plixir

Plixir is built using [Phoenix Framework](http://www.phoenixframework.org/) and [Ecto](https://github.com/elixir-lang/ecto) accessing a PostgreSQL database.

To start your Plixir application, you have to:

1. Install dependencies with `mix deps.get`
2. Run `npm install` to install javascript dependencies
3. Make sure you have a 'plixir' role in your Postgres
  CREATE USER plixir WITH PASSWORD 'plixir' CREATEDB;
4. Run Ecto migrations with `mix do ecto.create, ecto.migrate`
5. Start Phoenix endpoint with `mix phoenix.server`

Now you can visit `localhost:4000` from your browser.

### Contact Us
For **questions** or **general comments** regarding the use of this library, please use our public
[hipchat room](http://inaka.net/hipchat).

If you find any **bugs** or have a **problem** while using this library, please [open an issue](https://github.com/inaka/galgo/issues/new) in this repo (or a pull request :)).

And you can check all of our open-source projects at [inaka.github.io](http://inaka.github.io)
