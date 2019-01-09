defmodule Words do

  defp words_list(sentence) do
    Regex.replace(~r/[^\w\s]/, sentence, " ") |> String.split
  end

  defp count_words([], map), do: map

  defp count_words(string_list, map) do
    [head | tail] = string_list

    new_map = case Map.has_key?(map, head) do
      true  -> Map.put(map, head, (map[head] + 1))
      false -> Map.put(map, head, 1)
    end

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
