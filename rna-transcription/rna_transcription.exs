defmodule RNATranscription do

  defp transcribe_nucleotide(71), do: 'C'

  defp transcribe_nucleotide(67), do: 'G'

  defp transcribe_nucleotide(84), do: 'A'

  defp transcribe_nucleotide(65), do: 'U'

  defp transcribe_dna_sequence([]), do: []

  defp transcribe_dna_sequence(dna) do
    [head | tail] = dna
    transcribe_nucleotide(head) ++ transcribe_dna_sequence(tail)
  end

  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RNATranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    to_charlist transcribe_dna_sequence(dna)
  end
end
