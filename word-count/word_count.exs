defmodule Words do

  defp create_map(string_array, map) do
    # [head | tail] = string_array
    # create_map(tail)
    # Map.put(map, string_array[0], 1)
    Map.new(string_array, fn elem -> {elem, 1} end)
  end

  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    string_array = String.split(sentence)
    create_map string_array, %{}
  end
end
