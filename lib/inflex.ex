defmodule Inflex do
  use Application.Behaviour

  @uncountable  [
    "equipment",
    "fish",
    "information",
    "money",
    "rice",
    "series",
    "sheep",
    "species"
  ]

  @irregular [
    { "mouse", "mice" },
    { "man", "men" },
    { "person", "people" }
  ]

  def singularize(word) do
    cond do
      uncountable?(word) -> word
      true -> replace(word, @irregular)
    end
  end

  def replace(word, []), do: word
  def replace(word, [{p, s}|replacements]) do
    match(word, p, s) |> replace(replacements)
  end

  defp match(word, plural, singular) when word == plural, do: singular
  defp match(word, plural, singular) when word == singular, do: plural
  defp match(word, regex, replacement) when is_regex(regex) do
    Regex.replace(regex, word, replacement)
  end
  defp match(word,_,_), do: word

  defp uncountable?(word), do: Enum.member?(@uncountable, word)

  def start(_type, _args) do
    Inflex.Supervisor.start_link
  end
end
