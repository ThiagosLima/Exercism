defmodule Bob do
  def hey(input) do
    cond do
      nothing?(input) -> "Fine. Be that way!"
      question?(input) and yell?(input) -> "Calm down, I know what I'm doing!"
      question?(input) -> "Sure."
      yell?(input) -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end

  defp question?(string) do
    string
    |> String.trim()
    |> String.ends_with?("?")
  end

  defp yell?(string) do
    string == String.upcase(string) and String.downcase(string) != String.upcase(string)
  end

  defp nothing?(input) do
    String.trim(input) == ""
  end
end
