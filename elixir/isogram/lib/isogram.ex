defmodule Isogram do
  @doc """
  Determines if a word or sentence is an isogram
  """
  @spec isogram?(String.t()) :: boolean
  def isogram?(sentence) do
    sentence
    |> String.replace(~r/[^\w]/u, "")
    |> String.graphemes()
    |> Enum.frequencies()
    |> Enum.all?(fn {_key, value} -> value < 2 end)
  end
end
