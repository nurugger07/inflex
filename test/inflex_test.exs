defmodule Inflex do

  @uncountable  [ 
    "equipment", "fish", "information", "money", "rice", "series", "sheep", "species"
  ]

  def singularize(word) do
    cond do
      uncountable?(word) -> word
      true -> "dog" 
    end
  end

  defp uncountable?(word), do: Enum.member?(@uncountable, word)
end

defmodule InflexTest do
  use ExUnit.Case

  import Inflex

  test :singularize do
    assert "dog" == singularize("dogs")
    assert "sheep" == singularize("sheep")
  end
end
