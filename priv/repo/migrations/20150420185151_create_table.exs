defmodule Plixir.Repo.Migrations.CreateTable do
  use Ecto.Migration

  def change do
    create table(:tables) do
      add :name, :string
      add :type, :string
      add :max_players, :integer
      add :current_players, :integer

      timestamps
    end
  end
end
