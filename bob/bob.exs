defmodule Bob do

  defp uppercase?(text), do: text == String.upcase(text)

  defp question?(text), do: String.ends_with?(text, "?")

  defp only_letters?(text), do: String.upcase(text) != String.downcase(text)

  def blank?(text), do: String.trim(text) == ""

  def simple_question?(text) do
    question?(text)
  end

  def uppercase_question?(text) do
    uppercase?(text) && question?(text) && only_letters?(text)
  end

  def uppercase_shouting?(text) do
    uppercase?(text) && only_letters?(text)
  end

  def hey(input) do
    cond do
      uppercase_question?(input) ->
        "Calm down, I know what I'm doing!"
      simple_question?(input) ->
        "Sure."
      uppercase_shouting?(input) ->
        "Whoa, chill out!"
      blank?(input) ->
        "Fine. Be that way!"
      true ->
        "Whatever."
    end
  end
end
