defmodule Roman do

  defp convert(0), do: ""
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

  defp convert(40), do: "XL"
  defp convert(50), do: "L"

  defp convert(90), do: "XC"
  defp convert(100), do: "C"

  defp convert(400), do: "CD"
  defp convert(500), do: "D"

  defp convert(900), do: "CM"
  defp convert(1000), do: "M"

  defp convert(number) do
    cond do
      (number - 1000 >= 0) ->
        convert(1000) <> convert(number - 1000)
      (number - 900 >= 0) ->
        convert(900) <> convert(number - 900)
      (number - 500 >= 0) ->
        convert(500) <> convert(number - 500)
      (number - 400 >= 0) ->
        convert(400) <> convert(number - 400)
      (number - 100 >= 0) ->
        convert(100) <> convert(number - 100)
      (number - 90 >= 0) ->
        convert(90) <> convert(number - 90)
      (number - 50 >= 0) ->
        convert(50) <> convert(number - 50)
      (number - 40 >= 0) ->
        convert(40) <> convert(number - 40)
      (number - 10 >= 0) ->
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
