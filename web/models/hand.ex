defmodule Plixir.Hand do
  alias Plixir.Card

  @ranking [:high_card, :one_pair, :two_pairs, :three_of_a_kind, :straight, :flush, :full_house, :four_of_a_kind, :straight_flush, :royal_flush]

  @doc """
  Given a set of cards, returns a score data with the format:
  {score_value, hand_name, highest_card}
  
  ## Examples

    iex> Plixir.Hand.score(["KC", "9S", "KS", "KD", "9D", "3C", "6D"])
    {6, :full_house, [13, 9]}

  """
  def score(cards) do
    grouped_cards = Card.group(cards)
    counters = Enum.map(grouped_cards, &Enum.count/1)
    find_score(counters, grouped_cards)
  end

  defp high_values(grouped_cards, count \\ 1) do
    find_high_values(grouped_cards, [], count)
  end
  defp find_high_values(_, acc, 0) do acc end
  defp find_high_values([head|tail], acc, count) do
    value = head |> List.first |> Card.value
    find_high_values(tail, acc ++ [value], count - 1)
  end

  defp find_score([4 | _], grouped_cards) do
    {7, :four_of_a_kind, high_values(grouped_cards)}
  end
  defp find_score([3, 2 | _], grouped_cards) do
    {6, :full_house, high_values(grouped_cards, 2)}
  end
  defp find_score([3 | _], grouped_cards) do
    {3, :three_of_a_kind, high_values(grouped_cards)}
  end
  defp find_score([2, 2 | _], grouped_cards) do
    {2, :two_pairs, high_values(grouped_cards, 2)}
  end
  defp find_score([2 | _], grouped_cards) do
    {1, :one_pair, high_values(grouped_cards)}
  end
  defp find_score(_, grouped_cards) do
    {0, :high_card, high_values(grouped_cards)}
  end

end
