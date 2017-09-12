defmodule Inflex.Ordinalize do
  @moduledoc false

  def ordinalize(number) when is_number(number) do
    cond do
      rem(number, 100) in 11..13 ->
        Integer.to_string(number) <> "th"
      rem(number, 10) == 1 ->
        Integer.to_string(number) <> "st"
      rem(number, 10) == 2 ->
        Integer.to_string(number) <> "nd"
      rem(number, 10) == 3 ->
        Integer.to_string(number) <> "rd"
      true ->
        Integer.to_string(number) <> "th"
    end
  end
end
