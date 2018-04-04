defmodule Inflex.Camelize do
  @moduledoc false

  def camelize(word, option\\:upper) do
    case Regex.split(~r/(?:^|[-_])|(?=[A-Z])/, to_string(word)) do
      words ->
        words |> Enum.filter(&(&1 != "")) |> camelize_list(option)
        |> Enum.join()
    end
  end

  defp camelize_list([], :upper), do: []
  defp camelize_list([h|tail], :lower) do
    [lowercase(h)] ++ camelize_list(tail, :upper)
  end
  defp camelize_list([h|tail], :upper) do
    [capitalize(h)] ++ camelize_list(tail, :upper)
  end

  def capitalize(word), do: String.capitalize(word)
  def lowercase(word), do: String.downcase(word)
end
