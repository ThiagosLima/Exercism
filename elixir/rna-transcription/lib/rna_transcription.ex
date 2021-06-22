defmodule RnaTranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RnaTranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    dna_to_rna = %{ ?A => ?U, ?C => ?G, ?T => ?A, ?G => ?C }
    Enum.map(dna, &(dna_to_rna[&1]))
  end
end
