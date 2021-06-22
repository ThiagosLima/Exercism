defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    string
    |> String.replace(~r/\-|\_|'/, "")
    |> String.replace(~r/(\p{Ll})(\p{Lu})/, "\\g{1} \\g{2}")
    |> String.replace(~r/\w+/, &String.capitalize/1)
    |> String.replace(~r/[^\p{Lu}]/, "")
  end
end
