defmodule Plixir.Table do
  use Plixir.Web, :model

  schema "tables" do
    field :name, :string
    field :type, :string
    field :max_players, :integer
    field :current_players, :integer

    timestamps
  end

  @required_fields ~w(name type max_players current_players)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If `params` are nil, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ nil) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
