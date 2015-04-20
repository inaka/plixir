defmodule Plixir.TableChannel do
  use Phoenix.Channel

  def join("tables:lobby", auth_msg, socket) do
    {:ok, socket}
  end

  def handle_in("table_created", payload, socket) do
    broadcast! socket, "table_created", payload
    {:noreply, socket}
  end
end