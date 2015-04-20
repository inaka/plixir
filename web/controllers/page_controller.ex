defmodule Plixir.PageController do
  use Plixir.Web, :controller

  plug :action

  def index(conn, _params) do
    render conn, "index.html"
  end
end
