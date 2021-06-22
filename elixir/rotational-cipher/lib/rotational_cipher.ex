defmodule RotationalCipher do
  @alphabet_length 26

  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    text
      |> String.to_charlist()
      |> Enum.map(&(&1 + rem(shift, @alphabet_length)))
      |> List.to_string()
    # for <<char <- text>>, into: ""  do
    #   <<char + rem(shift, @alphabet_length)>>
    # end
  end
end
