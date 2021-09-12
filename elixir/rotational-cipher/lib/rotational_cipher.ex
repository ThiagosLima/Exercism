defmodule RotationalCipher do
  @alphabet_length 26
  @lower_case ?a..?z
  @upper_case ?A..?Z

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
    |> Enum.map(&rotate_letter(&1, shift))
    |> List.to_string()
  end

  defp rotate_letter(letter, shift) when letter in @lower_case do
    ?a + rem(shift + letter - ?a, @alphabet_length)
  end

  defp rotate_letter(letter, shift) when letter in @upper_case do
    ?A + rem(shift + letter - ?A, @alphabet_length)
  end

  defp rotate_letter(letter, _shift), do: letter
end
