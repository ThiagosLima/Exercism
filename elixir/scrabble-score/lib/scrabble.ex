defmodule Scrabble do
  @doc """
  Calculate the scrabble score for the word.
  """
  @spec score(String.t()) :: non_neg_integer
  def score(word) do
    word
    |> String.upcase()
    |> String.graphemes()
    |> Enum.reduce(0, &(get_letter_value(&1) + &2))
  end

  def get_letter_value(letter) when letter in ~w(A E I O U L N R S T), do: 1
  def get_letter_value(letter) when letter in ~w(D G), do: 2
  def get_letter_value(letter) when letter in ~w(B C M P), do: 3
  def get_letter_value(letter) when letter in ~w(F H V W Y), do: 4
  def get_letter_value(letter) when letter in ~w(K), do: 5
  def get_letter_value(letter) when letter in ~w(J X), do: 8
  def get_letter_value(letter) when letter in ~w(Q Z), do: 10
  def get_letter_value(_), do: 0
end
