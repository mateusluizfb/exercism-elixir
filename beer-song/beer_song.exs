defmodule BeerSong do
  def verse(0) do
    """
    No more bottles of beer on the wall, no more bottles of beer.
    Go to the store and buy some more, 99 bottles of beer on the wall.
    """
  end

  def verse(1) do
    """
    1 bottle of beer on the wall, 1 bottle of beer.
    Take it down and pass it around, no more bottles of beer on the wall.
    """
  end

  @doc """
  Get a single verse of the beer song
  """
  @spec verse(integer) :: String.t()
  def verse(number) do
    remaining_beers = number - 1

    bottle_word = cond do
      remaining_beers > 1 -> "bottles"
      true                -> "bottle"
    end

    """
    #{number} bottles of beer on the wall, #{number} bottles of beer.
    Take one down and pass it around, #{remaining_beers} #{bottle_word} of beer on the wall.
    """
  end

  def create_verse(0), do: verse(0)
  def create_verse(n), do: verse(n) <> "\n"

  def lyrics() do
    to_string Enum.map(99..0, &create_verse/1)
  end

  @doc """
  Get the entire beer song for a given range of numbers of bottles.
  """
  @spec lyrics(Range.t()) :: String.t()
  def lyrics(range) do
    to_string Enum.map(range, &create_verse/1)
  end
end
