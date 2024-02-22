defmodule Inflex.Parameterize do
  @moduledoc """
  # Inflex.Parameterize

  `Inflex.Parameterize` provides functionality prameterize strings (replacing spaces &20 with "-" or provided replacement string).

  ## Functions

  - `parameterize/2`: This function takes a string and an optional space replacement string and returns the parameterized version of the string.

  - `parameterize_to_ascii/2`: parameterizes string after stripping any non a-zA-Z ascii characters.
  """


  @doc """
  # Inflex.Parameterize.parameterize/2

  `Inflex.Parameterize.parameterize/2` returns the parameterized version of the string.

  ## Examples

      iex> Inflex.Parameterize.parameterize("Hello World", "*")
      "hello*world"
  """
  def parameterize(string, option \\ "-") do
    string
    |> clean_split()
    |> Stream.map(&String.trim/1)
    |> Enum.join(option)
  end

  @doc """
  # Inflex.Parameterize.parameterize_to_ascii/2

  `Inflex.Parameterize.parameterize_to_ascii/2` returns the parameterized version of the string with any non a-zA-Z characters removed.

  ## Examples

      iex> Inflex.Parameterize.parameterize_to_ascii("Héllo Wørld23", "*")
      "hello*wrld"
  """
  def parameterize_to_ascii(string, option \\ "-") do
    string
    |> clean_split()
    |> Stream.map(&trim_replace/1)
    |> Enum.join(option)
  end

  defp clean_split(string) do
    string
    |> String.downcase()
    |> :unicode.characters_to_nfd_binary()
    |> String.split(~r/\s|\%20/)
  end

  defp trim_replace(string) do
    string
    |> String.trim()
    |> String.replace(~r/[^A-z\s]/u, "")
  end
end
