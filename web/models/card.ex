defmodule Plixir.Card do
  @doc """
  Given a string card, returns its integer value

  ## Examples

    iex> Plixir.Card.value("AC")
    14
    iex> Plixir.Card.value("QD")
    11
    iex> Plixir.Card.value("6S")
    6

  """
  def value("A" <> _), do: 14
  def value("K" <> _), do: 13
  def value("J" <> _), do: 12
  def value("Q" <> _), do: 11
  def value(card) do
    card
    |> String.first
    |> String.to_integer
  end

  @doc """
  Given a list of cards, returns it sorted by card values, descending

  ## Examples

    iex> Plixir.Card.sort(["2S", "3D", "AC", "6H", "4S"])
    ["AC", "6H", "4S", "3D", "2S"]

  """
  def sort(cards) do
    cards
    |> Enum.sort_by(&value/1)
    |> Enum.reverse
  end
  
  @doc """
  Given a list of cards, returns it grouped by card values

  ##Examples

    iex> Plixir.Card.group(["AC", "4D", "4S", "2D", "2S"])
    [["4S", "4D"], ["2S", "2D"], ["AC"]]

  """
  def group(cards) do
    cards
    |> Enum.group_by(&value/1)
    |> Map.values
    |> Enum.sort_by(&Enum.count/1)
    |> Enum.reverse
  end
end
