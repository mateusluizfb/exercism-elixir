defmodule Roman do

  defp convert(1), do: "I"
  defp convert(2), do: "II"
  defp convert(3), do: "III"
  defp convert(4), do: "IV"
  defp convert(5), do: "V"
  defp convert(6), do: "VI"
  defp convert(7), do: "VII"
  defp convert(8), do: "VIII"
  defp convert(9), do: "IX"
  defp convert(10), do: "X"

  defp convert(50), do: "L"
  defp convert(100), do: "C"
  defp convert(500), do: "D"
  defp convert(1000), do: "M"

  defp convert(number) do
    cond do
      (number/10 > 0) ->
        convert(10) <> convert(number - 10)
      true ->
        convert(number)
    end
  end


  @doc """
  Convert the number to a roman number.
  """
  @spec numerals(pos_integer) :: String.t()
  def numerals(number) do
    convert(number)
  end
end
