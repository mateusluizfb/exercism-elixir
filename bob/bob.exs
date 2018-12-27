defmodule Bob do

  def uppercase_question?(text) do
    String.match? text, ~r/([A-Z]\?)/
  end

  def question?(text) do
    String.match? text, ~r/([a-z]\?|[0-9]\?)/
  end

  def uppercase_shouting?(text) do
    String.match? text, ~r/(\b\p{Lu}+\b)/
  end

  def blank_statment?(text) do
    String.trim(text) == ""
  end

  def hey(input) do
    cond do
      uppercase_question?(input) ->
        "Calm down, I know what I'm doing!"
      uppercase_shouting?(input) ->
        "Whoa, chill out!"
      question?(input) ->
        "Sure."
      blank_statment?(input) ->
        "Fine. Be that way!"
      true ->
        "Whatever."
    end
  end
end
