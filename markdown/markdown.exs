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
  def parse(m) do
    Enum.map(String.split(m, "\n"), &process/1)
      |> Enum.join
      |> patch
  end

  defp process(t) do
    parse_md_level String.first(t), String.split(t)
  end

  defp parse_md_level("#", [h | t]) do
    hl = String.length(h)
    htl = Enum.join(t, " ")
    "<h#{hl}>#{htl}</h#{hl}>"
  end

  defp parse_md_level("*", word_list) do
    filtered_list = Enum.filter(word_list, fn elem -> elem != "*" end)
    "<li>#{join_words_with_tags(filtered_list)}</li>"
  end

  defp parse_md_level(_, word_list) do
    "<p>#{join_words_with_tags(word_list)}</p>"
  end

  defp join_words_with_tags(t) do
    Enum.join(t, " ") |> replace_tags
  end

  defp replace_tags(text) do
    String.replace(text, ~r/\__(.*?)\__/, "<strong>\\1</strong>")
      |> String.replace(~r/\_(.*?)\_/, "<em>\\1</em>")
  end

  defp patch(l) do
    String.replace_suffix(
      String.replace(l, "<li>", "<ul>" <> "<li>", global: false),
      "</li>",
      "</li>" <> "</ul>"
    )
  end
end
