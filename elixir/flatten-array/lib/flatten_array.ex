defmodule FlattenArray do
  @doc """
    Accept a list and return the list flattened without nil values.

    ## Examples

      iex> FlattenArray.flatten([1, [2], 3, nil])
      [1,2,3]

      iex> FlattenArray.flatten([nil, nil])
      []

  """

  @spec flatten(list) :: list
  # def flatten([]), do: []

  # def flatten([head | tail]) when is_list(head) do
  #   flatten(head) ++ flatten(tail)
  # end

  # def flatten([head | tail]) when not is_nil(head) do
  #   [head] ++ flatten(tail)
  # end

  # def flatten([_head | tail]), do: flatten(tail)

  # def flatten(list) do
  #   new_list = Enum.reject(list, &is_nil/1)
  #   for <<el <- "#{new_list}">>, do: el
  #   # Enum.reduce(list, [], fn x, acc -> if acc ++ is_list(x), do: flatten(x), else: acc ++ [x]  end)
  # end
  # def flatten(element) when not(is_list(element)), do: [element]
  # def flatten(list) do
  #   list
  #   |> Enum.map(&flatten/1)
  #   |> Enum.concat()
  #   |> Enum.reject(&is_nil/1)
  # end
  def flatten(list) do
    list
    |> List.flatten()
    |> Enum.reject(&is_nil/1)
  end
end
