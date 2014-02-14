defmodule Inflex.Parameterize do

  defmacro __using__([]) do
    quote do
      import unquote __MODULE__

      def parameterize(word, option\\"-") do
        Regex.split(~r/\s|\%20/, word) |>
        Enum.join(option) |>
        String.downcase
      end

    end
  end
end
