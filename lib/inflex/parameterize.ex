defmodule Inflex.Parameterize do
  @moduledoc false

  def parameterize(string, option \\ "-") do
    string
    |> clean_split()
    |> Stream.map(&String.trim/1)
    |> Enum.join(option)
  end

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
