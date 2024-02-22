defmodule Inflex.Ordinalize do
  @moduledoc """
  # Inflex.Ordinalize

  `Inflex.Ordinalize` provides functionality to convert numbers into their ordinal form.

  ## Examples

      iex>    Inflex.Ordinalize.ordinalize(1)
      "1st"

      iex>    Inflex.Ordinalize.ordinalize(2)
      "2nd"

  ## Functions

  - `ordinalize/1`: This is the main function of the module. It takes a number and returns the ordinal form of the number.

  ## Notes
  Please note that this function is designed to work with integer numbers. Non-integer numbers may not be handled correctly.
  """

  def ordinalize(number) when is_number(number) do
    abs_number = abs(number)

    cond do
      rem(abs_number, 100) in 11..13 ->
        Integer.to_string(number) <> "th"

      rem(abs_number, 10) == 1 ->
        Integer.to_string(number) <> "st"

      rem(abs_number, 10) == 2 ->
        Integer.to_string(number) <> "nd"

      rem(abs_number, 10) == 3 ->
        Integer.to_string(number) <> "rd"

      true ->
        Integer.to_string(number) <> "th"
    end
  end
end
