defmodule Username do
  defguard is_lowercase(codepoint) when codepoint >= ?a and codepoint <= ?z
  defguard is_underscore(codepoint) when codepoint == ?_

  def sanitize(username) do
    username
    |> Enum.map(&substitute_german_chars/1)
    |> List.flatten()
    |> Enum.filter(&(is_lowercase(&1) or is_underscore(&1)))
  end

  defp substitute_german_chars(codepoint) do
    case codepoint do
      ?ä -> 'ae'
      ?ö -> 'oe'
      ?ü -> 'ue'
      ?ß -> 'ss'
      _ -> codepoint
    end
  end
end
