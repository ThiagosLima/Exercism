defmodule PigLatin do
  @vowels ~w(a e i o u)
  @hu ~w(h u)
  @xy ~w(x y)
  @cqt ~w(c q t)
  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.

  Words beginning with consonants should have the consonant moved to the end of
  the word, followed by "ay".

  Words beginning with vowels (aeiou) should have "ay" added to the end of the
  word.

  Some groups of letters are treated like consonants, including "ch", "qu",
  "squ", "th", "thr", and "sch".

  Some groups are treated like vowels, including "yt" and "xr".
  """

  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) when is_binary(phrase) do
    phrase
    |> String.split()
    |> Enum.map_join(" ", fn word ->
      word
      |> String.graphemes()
      |> translate_list()
    end)
  end

  def translate_list([first | _tail] = phrase) when first in @vowels, do: "#{phrase}ay"

  def translate_list(["t" = first, second, "r" = third | tail])
      when second in @hu,
      do: "#{tail}#{first}#{second}#{third}ay"

  def translate_list([first, second | tail]) when first in @xy and second not in @vowels,
    do: "#{first}#{second}#{tail}ay"

  def translate_list([first, second | tail]) when first in @cqt and second in @hu,
    do: "#{tail}#{first}#{second}ay"

  def translate_list([first | tail]), do: translate_list(tail ++ [first])
end
