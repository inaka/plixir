defmodule Plixir.TableController do
  use Plixir.Web, :controller

  alias Plixir.Table

  plug :scrub_params, "table" when action in [:create, :update]
  plug :action

  def index(conn, _params) do
    tables = Repo.all(Table)
    render conn, "index.html", tables: tables
  end

  def new(conn, _params) do
    changeset = Table.changeset(%Table{})
    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"table" => table_params}) do
    changeset = Table.changeset(%Table{}, table_params)

    if changeset.valid? do
      table = Repo.insert(changeset)

      payload = %{id: table.id, name: table.name, type: table.type,
        max_players: table.max_players, current_players: table.current_players}
      Plixir.Endpoint.broadcast! "tables:lobby", "table_created", payload

      conn
      |> put_flash(:info, "Table created successfully.")
      |> redirect(to: table_path(conn, :index))
    else
      render conn, "new.html", changeset: changeset
    end
  end

  def show(conn, %{"id" => id}) do
    table = Repo.get(Table, id)
    render conn, "show.html", table: table
  end

  def edit(conn, %{"id" => id}) do
    table = Repo.get(Table, id)
    changeset = Table.changeset(table)
    render conn, "edit.html", table: table, changeset: changeset
  end

  def update(conn, %{"id" => id, "table" => table_params}) do
    table = Repo.get(Table, id)
    changeset = Table.changeset(table, table_params)

    if changeset.valid? do
      Repo.update(changeset)

      conn
      |> put_flash(:info, "Table updated successfully.")
      |> redirect(to: table_path(conn, :index))
    else
      render conn, "edit.html", table: table, changeset: changeset
    end
  end

  def delete(conn, %{"id" => id}) do
    table = Repo.get(Table, id)
    Repo.delete(table)

    conn
    |> put_flash(:info, "Table deleted successfully.")
    |> redirect(to: table_path(conn, :index))
  end
end
