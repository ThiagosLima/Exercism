defmodule ProteinTranslation do
  @proteins %{
    "UGU" => {:ok, "Cysteine"},
    "UGC" => {:ok, "Cysteine"},
    "UUA" => {:ok, "Leucine"},
    "UUG" => {:ok, "Leucine"},
    "AUG" => {:ok, "Methionine"},
    "UUU" => {:ok, "Phenylalanine"},
    "UUC" => {:ok, "Phenylalanine"},
    "UCU" => {:ok, "Serine"},
    "UCC" => {:ok, "Serine"},
    "UCA" => {:ok, "Serine"},
    "UCG" => {:ok, "Serine"},
    "UGG" => {:ok, "Tryptophan"},
    "UAU" => {:ok, "Tyrosine"},
    "UAC" => {:ok, "Tyrosine"},
    "UAA" => {:ok, "STOP"},
    "UAG" => {:ok, "STOP"},
    "UGA" => {:ok, "STOP"}
  }
  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @spec of_rna(String.t()) :: {atom, list(String.t())}
  def of_rna(rna) do
    if rna_valid?(rna) do
      {:ok, get_proteins(rna)}
    else
      {:error, "invalid RNA"}
    end
  end

  @doc """
  Given a codon, return the corresponding protein
  """
  @spec of_codon(String.t()) :: {atom, String.t()}
  def of_codon(codon) do
    Map.get(@proteins, codon, {:error, "invalid codon"})
  end

  defp rna_valid?(rna) do
    rna == String.replace(rna, ~r/[^AUCG]/, "")
  end

  defp get_proteins(rna) do
    rna
    |> String.split(~r/.{3}/, trim: true, include_captures: true)
    |> Stream.map(&elem(@proteins[&1], 1))
    |> Enum.take_while(&(&1 != "STOP"))
  end
end
