defmodule Grains do
  @doc """
  Calculate two to the power of the input minus one.
  """
  @spec square(pos_integer) :: pos_integer
  def square(number) when number > 0 and number < 65, do: {:ok, Integer.pow(2, number - 1)}
  def square(_), do: {:error, "The requested square must be between 1 and 64 (inclusive)"}

  @doc """
  Adds square of each number from 1 to 64.
  """
  @spec total :: pos_integer
  def total, do: {:ok, Enum.reduce(1..64, 0, &(elem(square(&1), 1) + &2))}
end
