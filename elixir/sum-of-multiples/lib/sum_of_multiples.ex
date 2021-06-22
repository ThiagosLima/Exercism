defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(limit, factors) do
    # factors
    # |> Stream.map(&(&1..(limit - 1)//&1))
    # |> Enum.map(&Enum.to_list/1)
    # |> List.flatten([])
    # |> Stream.uniq()
    # |> Enum.sum()

    1..(limit - 1)
    |> Enum.filter(fn num ->
      Enum.any?(factors, &(rem(num, &1) == 0))
    end)
    |> Enum.sum()
  end
end
