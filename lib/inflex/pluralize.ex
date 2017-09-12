defmodule Inflex.Pluralize do
  @moduledoc false
  @default true

  @uncountable  [
    "deer",
    "aircraft",
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
    { ~r/(alumn|cact|fung|radi|stimul|syllab)i/i, "\\1us" },
    { ~r/(alg|antenn|amoeb|larv|vertebr)ae/i, "\\1a" },
    { ~r/^(gen)era$/i, "\\1us"},
    { ~r/(pe)ople/i, "\\1rson" },
    { ~r/^(zombie)s$/i, "\\1" },
    { ~r/(g)eese/i, "\\1oose" },
    { ~r/(criteri)a/i, "\\1on" },
    { ~r/^(m)en$/i, "\\1an"},
    { ~r/^(echo)es/i, "\\1"},
    { ~r/^(hero)es/i, "\\1"},
    { ~r/^(potato)es/i, "\\1"},
    { ~r/^(tomato)es/i, "\\1"},
    { ~r/^(t)eeth/i, "\\1ooth"},
    { ~r/^(l)ice$/i, "\\1ouse"},
    { ~r/^(addend|bacteri|curricul|dat|memorand|quant)a$/i, "\\1um"},
    { ~r/^(di)ce/i, "\\1e"},
    { ~r/^(f)eet/i, "\\1oot"},
    { ~r/^(phenomen)a/i, "\\1on"},
    ]

  @plural_irregular [
    { ~r/(alumn|cact|fung|radi|stimul|syllab)us/i, "\\1i" },
    { ~r/(alg|antenn|amoeb|larv|vertebr)a/i, "\\1ae" },
    { ~r/^(gen)us$/i, "\\1era"},
    { ~r/(pe)rson/i, "\\1ople" },
    { ~r/^(zombie)s$/i, "\\1" },
    { ~r/(g)oose/i, "\\1eese" },
    { ~r/(criteri)on/i, "\\1a" },
    { ~r/^(men)$/i, "\\1"},
    { ~r/^(women)/i, "\\1"},
    { ~r/^(echo)/i, "\\1es"},
    { ~r/^(hero)/i, "\\1es"},
    { ~r/^(potato)/i, "\\1es"},
    { ~r/^(tomato)/i, "\\1es"},
    { ~r/^(t)ooth/i, "\\1eeth"},
    { ~r/^(l)ouse/i, "\\1ice"},
    { ~r/^(addend|bacteri|curricul|dat|memorand|quant)um$/i, "\\1a"},
    { ~r/^(di)e/i, "\\1ce"},
    { ~r/^(f)oot/i, "\\1eet"},
    { ~r/^(phenomen)on/i, "\\1a"},
    ]

  @singular @irregular ++ [
    { ~r/(child)ren/i, "\\1" },
    { ~r/(wo|sea)men$/i, "\\1man" },
    { ~r/^(m|l)ice$/i, "\\1ouse" },
    { ~r/(bus|canvas|status|alias)(es)?$/i, "\\1" },
    { ~r/(ss)$/i, "\\1" },
    { ~r/(database)s$/i, "\\1" },
    { ~r/(n)ews$/i, "\\1ews" },
    { ~r/([ti])a$/i, "\\1um" },
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
    { ~r/(m)an$/i, "\\1en" },
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
    { ~r/(bus|alias|status|canvas)$/i, "\\1es" },
    { ~r/(ax|test)is$/i, "\\1es" },
    { ~r/s$/i, "s" },
    { ~r/data$/i, "data" },
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
