use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
config :plixir, Plixir.Endpoint,
  secret_key_base: "jADsrdQ1xhQ0wBF67XtHKStSW78BJorJnnRXBaeLLxuAV/1JSvTPWWnwUc597wrW"

# Configure your database
config :plixir, Plixir.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "plixir_prod"
