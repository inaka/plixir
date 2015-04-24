defmodule Plixir.HandTest do
  use ExUnit.Case
  doctest Plixir.Hand
  alias Plixir.Hand
  
  test "score of 1 card" do
    assert Hand.score(["3D"]) == {0, :high_card, [3]}
  end

  test "score of 2 cards as high_card" do
    assert Hand.score(["2S", "3D"]) == {0, :high_card, [3]}
  end

  test "score of 5 cards as high_card" do
    assert Hand.score(["2S", "3D", "AC", "6H", "4S"]) == {0, :high_card, [14]}
  end

  test "score of 5 cards as high_card, with figures" do
    assert Hand.score(["2S", "QD", "KC", "JH", "4S"]) == {0, :high_card, [13]}
  end

  test "score of 2 cards as one_pair" do
    assert Hand.score(["2S", "2H"]) == {1, :one_pair, [2]}
  end

  test "score of 5 cards as one_pair" do
    assert Hand.score(["2S", "4D", "AC", "6H", "4S"]) == {1, :one_pair, [4]}
  end

  test "score of 5 cards as two_pairs" do
    assert Hand.score(["2S", "4D", "AC", "2H", "4S"]) == {2, :two_pairs, [4, 2]}
  end

  test "score of 7 cards as two_pairs" do
    assert Hand.score(["2S", "4D", "AC", "2H", "4S", "QD", "AD"]) == {2, :two_pairs, [14, 4]}
  end

  test "score of 5 cards as three_of_a_kind" do
    assert Hand.score(["2S", "4D", "2D", "2H", "QS"]) == {3, :three_of_a_kind, [2]}
  end

  test "score of 7 cards as three_of_a_kind" do
    assert Hand.score(["KS", "4D", "AC", "2H", "4S", "QD", "4H"]) == {3, :three_of_a_kind, [4]}
  end

  test "score of 5 cards as full_house" do
    assert Hand.score(["KC", "9S", "KS", "KD", "9D"]) == {6, :full_house, [13, 9]}
  end

  test "score of 7 cards as full_house" do
    assert Hand.score(["KC", "9S", "KS", "KD", "9D", "3C", "6D"]) == {6, :full_house, [13, 9]}
  end

  test "score of 5 cards as four_of_a_kind" do
    assert Hand.score(["JC", "9D", "JS", "JD", "JH"]) == {7, :four_of_a_kind, [12]}
  end

  test "score of 7 cards as four_of_a_kind" do
    assert Hand.score(["JC", "9D", "JS", "4H", "JD", "JH", "8C"]) == {7, :four_of_a_kind, [12]}
  end
end
