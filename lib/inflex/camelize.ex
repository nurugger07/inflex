defmodule Inflex.Camelize do

  defmacro __using__([]) do
    quote do
      import unquote __MODULE__

      def camelize(word, option\\:upper) do
        Regex.split(~r/(?:^|[-_])/, to_string(word)) |>
          camelize_list(option) |>
          Enum.join
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
  end
end
