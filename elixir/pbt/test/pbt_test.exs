defmodule PbtTest do
  use ExUnit.Case
  use PropCheck
  doctest Pbt

  property "finds biggest element" do
    forall x <- non_empty(list(integer())) do
      Pbt.biggest(x) == model_biggest(x)
    end 
  end

  property "picks the last number" do
    forall {list, known_last} <- {list(number()), number()} do
      known_list = list ++ [known_last]
      known_last == List.last(known_list)
    end
  end

  property "a sorted list has ordered pairs" do
    forall list <- list(term()) do
      is_ordered(Enum.sort(list))
    end
  end

  property "a sorted list keeps its size" do
    forall list <- list(number()) do
      length(list) == length(Enum.sort(list))
    end
  end

  property "no element added" do
    forall list <- list(number()) do
      sorted = Enum.sort(list)
      Enum.all?(sorted, fn element -> element in list end)
    end
  end

  property "no element deleted" do
    forall list <- list(number()) do
      sorted = Enum.sort(list)
      Enum.all?(list, fn element -> element in sorted end)
    end
  end

  def is_ordered([a, b | t]) do
    a <= b and is_ordered([b | t])
  end

  # lists with fewer than 2 elements 
  def is_ordered(_) do
    true
  end

  def model_biggest(list) do
    List.last(Enum.sort(list))
  end
end
