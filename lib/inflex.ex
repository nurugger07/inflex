defmodule Inflex do
  @doc """
  Camelizes or pascalizes strings and atoms.

  ## Examples

      iex> Inflex.camelize(:upper_camel_case)
      "UpperCamelCase"

      iex> Inflex.camelize("pascal-case", :lower)
      "pascalCase"
  """
  defdelegate camelize(word), to: Inflex.Camelize
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
  Parameterize a string given some separator.

  ## Examples

      iex> Inflex.parameterize("String for parameter")
      "string-for-parameter"

      iex> Inflex.parameterize("String with underscore", "_")
      "string_with_underscore"
  """
  defdelegate parameterize(word), to: Inflex.Parameterize
  defdelegate parameterize(word, option), to: Inflex.Parameterize

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
