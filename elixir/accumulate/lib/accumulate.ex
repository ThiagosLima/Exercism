defmodule Accumulate do
  # import Enum, only: [map: 2]
  @doc """
    Given a list and a function, apply the function to each list item and
    replace it with the function's return value.

    Returns a list.

    ## Examples

      iex> Accumulate.accumulate([], fn(x) -> x * 2 end)
      []

      iex> Accumulate.accumulate([1, 2, 3], fn(x) -> x * 2 end)
      [2, 4, 6]

  """

  @spec accumulate(list, (any -> any)) :: list
  def accumulate([], _), do: []

  def accumulate([head | tail], fun) do
    [fun.(head)] ++ accumulate(tail, fun)
  end

  # def accumulate([head | tail], fun) do
  # map(list, fun)
  # List.foldr(list, [], fn x, acc -> [fun.(x) | acc] end)
  # for el <- list, into: [], do: fun.(el)
  # [fun.(head)] ++ accumulate(tail, fun)
  # List.foldl(list, [], fn x, acc -> acc ++ [fun.(x)] end)
  # end
  # def accumulate([], _), do: []
  # def accumulate([head | tail], fun), do: [fun.(head)] ++ accumulate(tail, fun)

  # TEST for analyzer
  # def accumulate(list, fun) do
  # MyModule.acc(list, fun)
  # end

  # def accumulate([], _fun), do: []

  # def accumulate([head | tail], fun) do
  #   [fun.(head)] ++ accumulate(tail, fun)
  # end
end
