defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, a), do: :equal
  def compare([], _b), do: :sublist
  def compare(_a, []), do: :superlist

  def compare(a, b) do
    cond do
      # Stream.chunk_every(a, length(b), 1) |> Enum.any?(&(&1 === b)) -> :superlist
      # Stream.chunk_every(b, length(a), 1) |> Enum.any?(&(&1 === a)) -> :sublist
      b in Enum.chunk_every(a, length(b), 1) -> :superlist
      a in Enum.chunk_every(b, length(a), 1) -> :sublist
      a != b -> :unequal
    end
  end
end
