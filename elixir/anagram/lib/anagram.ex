defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t(), [String.t()]) :: [String.t()]
  def match(base, candidates) do
    candidates
    |> Enum.reject(&(String.downcase(&1) == String.downcase(base)))
    |> Enum.filter(&(count_letters(&1) == count_letters(base)))
  end

  def count_letters(word) do
    word
    |> String.downcase()
    |> String.graphemes()
    |> Enum.frequencies()
  end
end
