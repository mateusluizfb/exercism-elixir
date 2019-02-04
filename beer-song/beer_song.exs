defmodule BeerSong do


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
    # Your implementation here...
    remaining_beers = number - 1

    verse_text = """
    #{number} bottles of beer on the wall, #{number} bottles of beer.
    Take one down and pass it around, #{remaining_beers} bottles of beer on the wall.
    """

    verse_text
  end

  @doc """
  Get the entire beer song for a given range of numbers of bottles.
  """
  @spec lyrics(Range.t()) :: String.t()
  def lyrics(range) do
    # Your implementation here...
  end
end
