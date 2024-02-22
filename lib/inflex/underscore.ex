defmodule Inflex.Underscore do
  @moduledoc """
  The Inflex.Underscore module provides functionality for transforming strings or atoms into underscore format.

  ## Examples

      iex> Inflex.Underscore.underscore("CamelCase")
      "camel_case"

  """

  @doc """
  Transforms a given string or atom into underscore format.

  ## Parameters

  - `input`: The string or atom to be transformed. If an atom is provided, it is first converted to a string.

  ## Examples

      iex> Inflex.Underscore.underscore("CamelCase")
      "camel_case"

      iex> Inflex.Underscore.underscore(:PascalCase)
      "pascal_case"

  ## Returns

  The transformed string in underscore format.

  """
  def underscore(atom) when is_atom(atom) do
    case Atom.to_string(atom) do
      "Elixir." <> rest -> underscore(rest)
      word -> underscore(word)
    end
  end

  def underscore(word) when is_binary(word) do
    word
    |> String.replace(~r/([A-Z]+)([A-Z][a-z])/, "\\1_\\2")
    |> String.replace(~r/([a-z\d])([A-Z])/, "\\1_\\2")
    |> String.replace(~r/-/, "_")
    |> String.downcase()
  end
end
