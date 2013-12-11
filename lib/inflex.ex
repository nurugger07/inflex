defmodule Inflex do
  use Application.Behaviour

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
    { %r/(child)ren/i, "\\1" },
    { %r/(wo)?men$/i, "\\1man" },
    { %r/(m|l)ice/i, "\\1ouse" },
    { %r/people/i, "person" },
    { %r/^(zombie)s$/i, "\\1" }
  ]

  @singular [
    { %r/(bus)(es)?$/i, "\\1" },
    { %r/(ss)$/i, "\\1" },
    { %r/(database)s$/i, "\\1" },
    { %r/(n)ews$/i, "\\1ews" },
    { %r/([ti])a$/i, "\1um" },
    { %r/((a)naly|(b)a|(d)iagno|(p)arenthe|(p)rogno|(s)ynop|(t)he)(sis|ses)$/i, "\\1sis" },
    { %r/(analy)(sis|ses)$/i, "\\1sis" },
    { %r/([^f])ves$/i, "\\1fe" },
    { %r/(hive)s$/i, "\\1" },
    { %r/(tive)s$/i, '\\1' },
    { %r/([lr])ves$/i, "\\1f" },
    { %r/([^aeiouy]|qu)ies$/i, "\\1y" },
    { %r/(m)ovies$/i, "\\1ovie" },
    { %r/(x|ch|ss|sh)es$/i, "\\1" },
    { %r/(shoe)s$/i, "\\1" },
    { %r/(o)es$/i, "\\1" },
    { %r/(m|l)ice/i, "\\1ouse" },
    { %r/s$/i, "" },
  ]

  def singularize(word) do
    cond do
      uncountable?(word) -> word
      @default ->
        Enum.find(@irregular ++ @singular, fn({ reg, _ }) -> Regex.match?(reg, word) end) |> match(word)
    end
  end

  defp match({regex, replacement}, word) when is_regex(regex) do
    Regex.replace(regex, word, replacement)
  end
  defp match(_, word), do: word

  defp uncountable?(word), do: Enum.member?(@uncountable, word)

  def start(_type, _args) do
    Inflex.Supervisor.start_link
  end
end
