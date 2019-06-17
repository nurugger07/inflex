defmodule Inflex.Parameterize do
  @moduledoc false

  def parameterize(string, option\\"-") do
    string
      |> String.normalize(:nfd)
      |> String.replace(~r/[^A-z\s]/u, "")
      |> String.downcase()
      |> String.trim()
      |> String.replace(~r/\s+/, option)
  end
end
