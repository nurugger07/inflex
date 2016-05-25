defmodule Inflex.Pluralize do
  @moduledoc false
  @default true

  @uncountable  [
    "equipment",
    "fish",
    "information",
    "jeans",
    "money",
    "police",
    "rice",
    "series",
    "sheep",
    "species"
    ]

  @irregular [
    { ~r/people/i, "person" },
    { ~r/^(zombie)s$/i, "\\1" },
    { ~r/geese/i, "goose" },
    { ~r/criteria/i, "criterion" },
    { ~r/radii/i, "radius" },
    { ~r/^men/i, "man"},
    { ~r/^echoes/i, "echo"},
    { ~r/^heroes/i, "hero"},
    { ~r/^potatoes/i, "potato"},
    { ~r/^tomatoes/i, "tomato"},
    { ~r/^teeth/i, "tooth"},
    { ~r/^lice$/i, "louse"},
    { ~r/^quanta/i, "quantum"},
    { ~r/^dice/i, "die"},
    { ~r/^feet/i, "foot"},
    { ~r/^phenomena/i, "phenomenon"},
    ]

  @plural_irregular [
    { ~r/person/i, "people" },
    { ~r/^zombies$/i, "zombie" },
    { ~r/goose/i, "geese" },
    { ~r/criterion/i, "criteria" },
    { ~r/radius/i, "radii" },
    { ~r/^men/i, "men"},
    { ~r/^women/i, "women"},
    { ~r/^echo/i, "echoes"},
    { ~r/^hero/i, "heroes"},
    { ~r/^potato/i, "potatoes"},
    { ~r/^tomato/i, "tomatoes"},
    { ~r/^tooth/i, "teeth"},
    { ~r/^louse/i, "lice"},
    { ~r/^quantum/i, "quanta"},
    { ~r/^die/i, "dice"},
    { ~r/^foot/i, "feet"},
    { ~r/^phenomenon/i, "phenomena"},
    ]

  @singular @irregular ++ [
    { ~r/(child)ren/i, "\\1" },
    { ~r/(wo|sea)men$/i, "\\1man" },
    { ~r/(m|l)ice$/i, "\\1ouse" },
    { ~r/(bus)(es)?$/i, "\\1" },
    { ~r/(ss)$/i, "\\1" },
    { ~r/(database)s$/i, "\\1" },
    { ~r/(n)ews$/i, "\\1ews" },
    { ~r/([ti])a$/i, "\1um" },
    { ~r/((a)naly|(b)a|(d)iagno|(p)arenthe|(p)rogno|(s)ynop|(t)he)(sis|ses)$/i, "\\1sis" },
    { ~r/(analy)(sis|ses)$/i, "\\1sis" },
    { ~r/(octop|vir)i$/i, "\\1us" },
    { ~r/([^f])ves$/i, "\\1fe" },
    { ~r/(hive)s$/i, "\\1" },
    { ~r/(tive)s$/i, '\\1' },
    { ~r/([lr])ves$/i, "\\1f" },
    { ~r/([^aeiouy]|qu)ies$/i, "\\1y" },
    { ~r/(m)ovies$/i, "\\1ovie" },
    { ~r/(x|ch|ss|sh)es$/i, "\\1" },
    { ~r/(shoe)s$/i, "\\1" },
    { ~r/(o)es$/i, "\\1" },
    { ~r/s$/i, "" },
    ]

  @plural @plural_irregular ++ [
    { ~r/(child)$/i, "\\1ren" },
    { ~r/(wo)?man$/i, "\\1men" },
    { ~r/(m|l)ouse/i, "\\1ice" },
    { ~r/(database)s$/i, "\\1" },
    { ~r/(quiz)$/i, "\\1zes" },
    { ~r/^(ox)$/i, "\\1en" },
    { ~r/(matr|vert|ind)ix|ex$/i, "\\1ices" },
    { ~r/(x|ch|ss|sh)$/i, "\\1es" },
    { ~r/([^aeiouy]|qu)y$/i, "\\1ies" },
    { ~r/(hive)$/i, "\\1s" },
    { ~r/(?:([^f])fe|([lr])f)$/i, "\\1\\1ves" },
    { ~r/sis$/i, "ses" },
    { ~r/([ti])um$/i, "\\1a" },
    { ~r/(buffal|tomat)o$/i, "\\1oes" },
    { ~r/(octop|vir)us$/i, "\\1i" },
    { ~r/(alias|status)$/i, "\\1es" },
    { ~r/(ax|test)is$/i, "\\1es" },
    { ~r/(bus)$/i, "\\1es" },
    { ~r/s$/i, "s" },
    { ~r/$/i, "s" },
    ]

  def singularize(word) when is_atom(word) do
    find_match(@singular, to_string(word))
  end
  def singularize(word), do: find_match(@singular, word)

  def pluralize(word) when is_atom(word) do
    find_match(@plural, to_string(word))
  end
  def pluralize(word), do: find_match(@plural, word)

  def inflect(word, 1), do: singularize word
  def inflect(word, n) when is_number(n), do: pluralize word

  defp find_match(set, word) do
    cond do
      uncountable?(word) -> word
      @default -> replace_match(set, word)
    end
  end

  defp replace_match(set, word) do
    find_in_set(set, word) |> replace(word)
  end

  defp find_in_set(set, word) do
    Enum.find(set, fn({ reg, _ }) -> Regex.match?(reg, word) end)
  end

  defp replace({regex, replacement}, word) do
    Regex.replace(regex, word, replacement)
  end
  defp replace(_, word), do: word

  defp uncountable?(word), do: Enum.member?(@uncountable, word)
end
