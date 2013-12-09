defmodule Inflex do
  use Application.Behaviour

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

  def start(_type, _args) do
    Inflex.Supervisor.start_link
  end
end
