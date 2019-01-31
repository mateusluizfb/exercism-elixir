defmodule Roman do

  defp create_roman_numeral(roman_numeral, number) do
    convert(roman_numeral) <> convert(number - roman_numeral)
  end

  defp convert(0),  do: ""
  defp convert(1),  do: "I"
  defp convert(2),  do: "II"
  defp convert(3),  do: "III"
  defp convert(4),  do: "IV"
  defp convert(5),  do: "V"
  defp convert(6),  do: "VI"
  defp convert(7),  do: "VII"
  defp convert(8),  do: "VIII"
  defp convert(9),  do: "IX"
  defp convert(10), do: "X"

  defp convert(40), do: "XL"
  defp convert(50), do: "L"

  defp convert(90),  do: "XC"
  defp convert(100), do: "C"

  defp convert(400), do: "CD"
  defp convert(500), do: "D"

  defp convert(900),  do: "CM"
  defp convert(1000), do: "M"

  defp convert(number) do
    cond do
      (number - 1000 >= 0) -> create_roman_numeral(1000, number)
      (number - 900 >= 0)  -> create_roman_numeral(900, number)
      (number - 500 >= 0)  -> create_roman_numeral(500, number)
      (number - 400 >= 0)  -> create_roman_numeral(400, number)
      (number - 100 >= 0)  -> create_roman_numeral(100, number)
      (number - 90 >= 0)   -> create_roman_numeral(90, number)
      (number - 50 >= 0)   -> create_roman_numeral(50, number)
      (number - 40 >= 0)   -> create_roman_numeral(40, number)
      (number - 10 >= 0)   -> create_roman_numeral(10, number)
      true                 -> convert(number)
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
