defmodule Plixir.Endpoint do
  use Phoenix.Endpoint, otp_app: :plixir

  plug Plug.Static,
    at: "/", from: :plixir

  plug Plug.Logger

  # Code reloading will only work if the :code_reloader key of
  # the :phoenix application is set to true in your config file.
  plug Phoenix.CodeReloader

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Poison

  plug Plug.MethodOverride
  plug Plug.Head

  plug Plug.Session,
    store: :cookie,
    key: "_plixir_key",
    signing_salt: "uWMmaCXH",
    encryption_salt: "6CzhfAPc"

  plug :router, Plixir.Router
end
