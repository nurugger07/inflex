defmodule Inflex do
  @doc """
  Camelizes or pascalizes strings and atoms to upper-case CamelCase.

  ## Examples

      iex> Inflex.camelize(:upper_camel_case)
      "UpperCamelCase"
  """
  defdelegate camelize(word), to: Inflex.Camelize

  @doc """
  Camelizes or pascalizes strings and atoms.

  ## Options

  * `:lower` - Lower-cases the first letter.

  ## Examples

      iex> Inflex.camelize("pascal-case", :lower)
      "pascalCase"
  """
  defdelegate camelize(word, option), to: Inflex.Camelize

  @doc """
  Singularize a word.

  ## Examples

      iex> Inflex.singularize("dogs")
      "dog"

      iex> Inflex.singularize("people")
      "person"
  """
  defdelegate singularize(word), to: Inflex.Pluralize

  @doc """
  Pluralize a word.

  ## Examples

      iex> Inflex.pluralize("dog")
      "dogs"

      iex> Inflex.pluralize("person")
      "people"
  """
  defdelegate pluralize(word), to: Inflex.Pluralize

  @doc """
  Inflect on the plurality of a word given some count.

  ## Examples

      iex> Inflex.inflect("child", 1)
      "child"

      iex> Inflex.inflect("child", 2)
      "children"
  """
  defdelegate inflect(word, count), to: Inflex.Pluralize

  @doc """
  Parameterize a string using a hyphen (`-`) separator. If you want to return
  as only ascii characters, use `parameterize_to_ascii/2`

  ## Examples

      iex> Inflex.parameterize("String for parameter")
      "string-for-parameter"
  """
  defdelegate parameterize(word), to: Inflex.Parameterize

  @doc """
  Parameterize a string given some separator. If you want to return
  as only ascii characters, use `parameterize_to_ascii/2`

  The `option` argument is a string representing the character that
  will be used as the separator.

  ## Examples

      iex> Inflex.parameterize("String with underscore", "_")
      "string_with_underscore"
  """
  defdelegate parameterize(word, option), to: Inflex.Parameterize

  @doc """
  Parameterize a string using a hyphen (`-`) separator, returning
  only ascii characters.

  ## Examples

      iex> Inflex.parameterize_to_ascii("String for parameter 😎")
      "string-for-parameter-"
  """
  defdelegate parameterize_to_ascii(word), to: Inflex.Parameterize

  @doc """
  Parameterize a string given some separator, returning only ascii
  characters.

  The `option` argument is a string representing the character that
  will be used as the separator.

  ## Examples

      iex> Inflex.parameterize_to_ascii("String with underscore 😎", "_")
      "string_with_underscore_"
  """
  defdelegate parameterize_to_ascii(word, option), to: Inflex.Parameterize

  @doc """
  Underscore and lowercase a string.

  ## Examples

      iex> Inflex.underscore("UpperCamelCase")
      "upper_camel_case"

      iex> Inflex.underscore(:pascalCase)
      "pascal_case"
  """
  defdelegate underscore(word), to: Inflex.Underscore

  @doc """
  Converts an integer to a ordinal value.

  ## Examples

      iex> Inflex.ordinalize(1)
      "1st"

      iex> Inflex.ordinalize(11)
      "11th"
  """
  defdelegate ordinalize(number), to: Inflex.Ordinalize
end
