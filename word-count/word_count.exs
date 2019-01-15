defmodule Words do

  defp normalize_sentence(sentence) do
    String.replace(sentence, "_", " ") |> String.downcase
  end

  defp words_list(sentence) do
    String.split(normalize_sentence(sentence), ~r/[^\w\-]/u, trim: true)
  end

  defp count_words([], map), do: map

  defp count_words(string_list, map) do
    [head | tail] = string_list
    new_map = Map.update(map, head, 1, &(&1 + 1))
    count_words(tail, new_map)
  end

  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    string_list = words_list(sentence)
    count_words string_list, %{}
  end
end
