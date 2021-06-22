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
  # @spec commands(code :: integer) :: list(String.t())
  # def commands(code) do
  #   secret = %{ 0b1 => "wink", 0b10 => "double blink", 0b100 => "close your eyes", 0b1000 => "jump"}

  #   handshake = [0b1, 0b10, 0b100, 0b1000]
  #   |> Enum.filter( &((&1 &&& code) != 0) )
  #   |> Enum.map( &(secret[&1]) )

  #   if (code &&& 0b10000) == 0, do: Enum.reverse(handshake), else: handshake
  # end

  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    secret = %{ 0b1 => "wink", 0b10 => "double blink", 0b100 => "close your eyes", 0b1000 => "jump"}

    handshake = [0b1, 0b10, 0b100, 0b1000]
    |> Enum.filter( &((&1 &&& code) != 0) )
    |> Enum.map( &(secret[&1]) )

    if (code &&& 0b10000) == 0, do: Enum.reverse(handshake), else: handshake
  end

  # @spec commands(code :: integer) :: list(String.t())
  # def commands(code) do
  #   commands(code, [])
  # end

  # def commands(code, handshake) when code == 0 do
  #   unless List.first(handshake) do
  #     Enum.reverse(handshake)
  #   end
  # end

  # def commands(code, handshake) when rem(code, 16) == 0  do
  #   commands(code - 16, [true | handshake])
  # end

  # def commands(code, handshake) when rem(code, 8) == 0  do
  #   commands(code - 8, ["jump" | handshake])
  # end

  # def commands(code, handshake) when rem(code, 4) == 0  do
  #   commands(code - 4, ["close your eyes" | handshake])
  # end

  # def commands(code, handshake) when rem(code, 2) == 0  do
  #   commands(code - 2, ["double blink" | handshake])
  # end

  # def commands(code, handshake) when rem(code, 2) == 1  do
  #   commands(code - 1, ["wink" | handshake])
  # end
end
