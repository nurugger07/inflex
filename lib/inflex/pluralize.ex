defmodule Inflex.Pluralize do

  defmacro __using__([]) do
    quote do
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
        { ~r/radii/i, "radius" }
        ]

      @plural_irregular [
        { ~r/person/i, "people" },
        { ~r/^zombies$/i, "zombie" },
        { ~r/goose/i, "geese" },
        { ~r/criterion/i, "criteria" },
        { ~r/radius/i, "radii" }
        ]

      @singular @irregular ++ [
        { ~r/(child)ren/i, "\\1" },
        { ~r/(wo)?men$/i, "\\1man" },
        { ~r/(m|l)ice/i, "\\1ouse" },
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
        { ~r/(m|l)ice/i, "\\1ouse" },
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


      def singularize(word), do: find_match(@singular, word)

      def pluralize(word), do: find_match(@plural, word)

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
  end

end
