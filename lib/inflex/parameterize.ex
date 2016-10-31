defmodule Inflex.Parameterize do
  @moduledoc false

  def parameterize(word, option\\"-") do
    Regex.split(~r/\s|\%20/, word) |>
    Enum.join(option) |>
    String.downcase |>
    String.replace(~r/[^a-z0-9\-_]+/i, option)
  end
end
