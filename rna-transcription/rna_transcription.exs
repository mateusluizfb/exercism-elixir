defmodule RNATranscription do

  defp transcribe_nucleotide(?G), do: ?C

  defp transcribe_nucleotide(?C), do: ?G

  defp transcribe_nucleotide(?T), do: ?A

  defp transcribe_nucleotide(?A), do: ?U

  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RNATranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    Enum.map(dna, &transcribe_nucleotide(&1))
  end
end
