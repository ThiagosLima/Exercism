defmodule Markdown do
  @doc """
    Parses a given string with Markdown syntax and returns the associated HTML for that string.

    ## Examples

    iex> Markdown.parse("This is a paragraph")
    "<p>This is a paragraph</p>"

    iex> Markdown.parse("#Header!\n* __Bold Item__\n* _Italic Item_")
    "<h1>Header!</h1><ul><li><em>Bold Item</em></li><li><i>Italic Item</i></li></ul>"
  """
  @spec parse(String.t()) :: String.t()
  def parse(markdown) do
    # Used more meaningful param name
    # Used pipe to make the flow of code more readable
    # Used & to simplify process/1 call
    # Used Stream to make it lazy as much as possible
    markdown
    |> String.split("\n")
    |> Stream.map(&process/1)
    |> Enum.join()
    |> add_list_tag()
  end

  # Used more meaningful param name
  # Replaced if/else with multiclause funciton
  # Replaced nested calls with pipe
  defp process("*" <> _ = line), do: parse_list_md_level(line)

  defp process("#" <> _ = line) do
    line
    |> parse_header_md_level()
    |> enclose_with_header_tag()
  end

  defp process(line) do
    line
    |> String.split()
    |> enclose_with_paragraph_tag()
  end

  defp parse_header_md_level(header) do
    # Used more meaningful param name
    # Deleted redundant to_string/1 function
    [level | content] = String.split(header)

    {String.length(level), Enum.join(content, " ")}
  end

  defp parse_list_md_level(list) do
    # Used more meaningful variable names
    # Used pipe to make the flow of code more readable
    # Used string interpolation to make string concatanation more readable
    parsed_list =
      list
      |> String.trim_leading("* ")
      |> String.split()
      |> join_words_with_tags()

    "<li>#{parsed_list}</li>"
  end

  defp enclose_with_header_tag({level, content}) do
    # Used more meaningful variable names
    # Used string interpolation to make string concatanation more readable
    "<h#{level}>#{content}</h#{level}>"
  end

  defp enclose_with_paragraph_tag(content) do
    # Used more meaningful param name
    "<p>#{join_words_with_tags(content)}</p>"
  end

  defp join_words_with_tags(word) do
    # Used more meaningful param name
    # Used pipe to make the flow of code more readable
    # Used & to simplify replace_md_with_tag/1 call
    # Used Stream to make it lazy as much as possible
    word
    |> Stream.map(&replace_md_with_tag/1)
    |> Enum.join(" ")
  end

  defp replace_md_with_tag(word) do
    # Used more meaningful param name
    # Used pipe to make the flow of code more readable
    word
    |> replace_prefix_md()
    |> replace_suffix_md()
  end

  # Replaced cond with multiclause functions
  # Used more meaningful param name
  defp replace_prefix_md("__" <> word), do: "<strong>#{word}"
  defp replace_prefix_md("_" <> word), do: "<em>#{word}"
  defp replace_prefix_md(word), do: word

  defp replace_suffix_md(word) do
    # Used more meaningful param name
    # Used pipe to make the flow of code more readable
    # Replaced cond with String.replace
    word
    |> String.replace_suffix("__", "</strong>")
    |> String.replace_suffix("_", "</em>")
  end

  defp add_list_tag(markdown) do
    # Used more meaningful param name
    # Used pipe to make the flow of code more readable
    # Deleted redundant string concatanation `<>`
    markdown
    |> String.replace("<li>", "<ul><li>", global: false)
    |> String.replace_suffix("</li>", "</li></ul>")
  end
end
