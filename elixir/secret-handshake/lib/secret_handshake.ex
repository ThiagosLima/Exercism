defmodule SecretHandshake do
  use Bitwise

  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) when code > 31, do: []
  def commands(code), do: append(code, [])

  defp append(code, acc) when code == 0, do: acc
  defp append(code, acc) when (code &&& 8) == 8, do: append(code - 8, ["jump" | acc])
  defp append(code, acc) when (code &&& 4) == 4, do: append(code - 4, ["close your eyes" | acc])
  defp append(code, acc) when (code &&& 2) == 2, do: append(code - 2, ["double blink" | acc])
  defp append(code, acc) when (code &&& 1) == 1, do: append(code - 1, ["wink" | acc])
  defp append(code, acc) when (code &&& 16) == 16, do: Enum.reverse(acc)
end
