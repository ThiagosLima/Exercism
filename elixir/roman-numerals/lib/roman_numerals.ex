defmodule RomanNumerals do
  @romans %{
    unit: %{1 => "I", 5 => "V", 10 => "X"},
    ten: %{1 => "X", 5 => "L", 10 => "C"},
    hundred: %{1 => "C", 5 => "D", 10 => "M"},
    thousand: %{1 => "M"}
  }

  @doc """
  Convert the number to a roman number.
  """
  @spec numeral(pos_integer) :: String.t()
  def numeral(number) do
    digits = Integer.digits(number)

    unit = digit_to_roman(:unit, Enum.at(digits, -1))
    ten = digit_to_roman(:ten, Enum.at(digits, -2))
    hundred = digit_to_roman(:hundred, Enum.at(digits, -3))
    thousand = digit_to_roman(:thousand, Enum.at(digits, -4))

    "#{thousand}#{hundred}#{ten}#{unit}"
  end

  defp digit_to_roman(position, digit) when digit == 4 do
    @romans[position][1] <> @romans[position][5]
  end

  defp digit_to_roman(position, digit) when digit == 9 do
    @romans[position][1] <> @romans[position][10]
  end

  defp digit_to_roman(position, digit) when digit < 5 do
    String.duplicate(@romans[position][1], digit)
  end

  defp digit_to_roman(position, digit) when not is_nil(digit) do
    @romans[position][5] <> String.duplicate(@romans[position][1], rem(digit, 5))
  end

  defp digit_to_roman(_, _), do: ""
end
