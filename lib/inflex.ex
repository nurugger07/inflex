defmodule Inflex do
  @external_resource "README.md"
  @moduledoc "README.md"
             |> File.read!()
             |> String.split("<!-- MDOC !-->")
             |> Enum.fetch!(1)

  @doc """
  Camelizes or pascalizes strings and atoms to upper-case CamelCase.

  @see `Inflex.Camelize.camelize/2` for more information.


  ## Examples

      iex> Inflex.camelize(:upper_camel_case)
      "UpperCamelCase"

  """
  defdelegate camelize(word), to: Inflex.Camelize

  @doc """
  Camelizes or pascalizes strings and atoms.

  @see `Inflex.Camelize.camelize/2` for more information.

  ## Options

  * `:lower` - Lower-cases the first letter.

  ## Examples

      iex> Inflex.camelize("pascal-case", :lower)
      "pascalCase"

  """
  defdelegate camelize(word, option), to: Inflex.Camelize

  @doc """
  Singularize a word.

  @see `Inflex.Pluralize.singularize/1` for more information.

  ## Examples

      iex> Inflex.singularize("dogs")
      "dog"

      iex> Inflex.singularize("people")
      "person"

  """
  defdelegate singularize(word), to: Inflex.Pluralize

  @doc """
  Pluralize a word.

  @see `Inflex.Pluralize.pluralize/1` for more information.

  ## Examples

      iex> Inflex.pluralize("dog")
      "dogs"

      iex> Inflex.pluralize("person")
      "people"

  """
  defdelegate pluralize(word), to: Inflex.Pluralize

  @doc """
  Inflect on the plurality of a word given some count.

  @see `Inflex.Pluralize.inflect/2` for more information.

  ## Examples

      iex> Inflex.inflect("child", 1)
      "child"

      iex> Inflex.inflect("child", 2)
      "children"

  """
  defdelegate inflect(word, count), to: Inflex.Pluralize

  @doc """
  Parameterize a string using a hyphen (`-`) separator. If you want to return
  as only ASCII characters, use `parameterize_to_ascii/2`

  @see `Inflex.Parameterize.parameterize/2` for more information.

  ## Examples

      iex> Inflex.parameterize("String for parameter")
      "string-for-parameter"

  """
  defdelegate parameterize(word), to: Inflex.Parameterize

  @doc """
  Parameterize a string given some separator. If you want to return
  as only ASCII characters, use `parameterize_to_ascii/2`

  The `option` argument is a string representing the character that
  will be used as the separator.

  @see `Inflex.Parameterize.parameterize/2` for more information.

  ## Examples

      iex> Inflex.parameterize("String with underscore", "_")
      "string_with_underscore"

  """
  defdelegate parameterize(word, option), to: Inflex.Parameterize

  @doc """
  Parameterize a string using a hyphen (`-`) separator, returning
  only ASCII characters.

  @see `Inflex.Parameterize.parameterize_to_ascii/2` for more information.

  ## Examples

      iex> Inflex.parameterize_to_ascii("String for parameter 😎")
      "string-for-parameter-"

  """
  defdelegate parameterize_to_ascii(word), to: Inflex.Parameterize

  @doc """
  Parameterize a string given some separator, returning only ASCII
  characters.

  The `option` argument is a string representing the character that
  will be used as the separator.

  @see `Inflex.Parameterize.parameterize_to_ascii/2` for more information.

  ## Examples

      iex> Inflex.parameterize_to_ascii("String with underscore 😎", "_")
      "string_with_underscore_"

  """
  defdelegate parameterize_to_ascii(word, option), to: Inflex.Parameterize

  @doc """
  Underscore and lowercase a string.

  @see `Inflex.Underscore.underscore/1` for more information.

  ## Examples

      iex> Inflex.underscore("UpperCamelCase")
      "upper_camel_case"

      iex> Inflex.underscore(:pascalCase)
      "pascal_case"

  """
  defdelegate underscore(word), to: Inflex.Underscore

  @doc """
  Converts an integer to a ordinal value.

  @see `Inflex.Ordinalize.ordinalize/1` for more information.

  ## Examples

      iex> Inflex.ordinalize(1)
      "1st"

      iex> Inflex.ordinalize(11)
      "11th"

  """
  defdelegate ordinalize(number), to: Inflex.Ordinalize
end
