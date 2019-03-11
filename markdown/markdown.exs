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
    String.split(markdown, "\n")
      |> Enum.map_join("", &process/1)
      |> patch_list
  end

  defp process(text) do
    parse_row String.first(text), String.split(text)
  end

  defp parse_row("#", [head | tail]) do
    header_length = String.length(head)
    header_text = Enum.join(tail, " ")

    "<h#{header_length}>#{header_text}</h#{header_length}>"
  end

  defp parse_row("*", word_list) do
    filtered_list = Enum.filter(word_list, &(&1 != "*" ))

    "<li>#{replace_tags(filtered_list)}</li>"
  end

  defp parse_row(_, word_list) do
    "<p>#{replace_tags(word_list)}</p>"
  end

  defp replace_tags(words) do
    Enum.join(words, " ")
      |> String.replace(~r/\__(.*?)\__/, "<strong>\\1</strong>")
      |> String.replace(~r/\_(.*?)\_/, "<em>\\1</em>")
  end

  defp patch_list(list) do
    String.replace(list, ~r/<li>.*<\/li>/, "<ul>\\0</ul>")
  end
end
