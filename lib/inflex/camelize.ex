defmodule Inflex.Camelize do
    @moduledoc """
    # Inflex.Camelize

    `Inflex.Camelize` provides functionality to convert strings into CamelCase format.

    ## Usage

    The main function in this module is `camelize/2`. This function takes a string and an option as arguments and returns the CamelCase version of the string.

    Here is an example of how to use it:

    ```elixir
    Inflex.Camelize.camelize("hello_world", :upper)
    # Returns: "HelloWorld"
    ```

    In the example above, the string "hello_world" is converted to "HelloWorld". The `:upper` option indicates that the first letter of the output should be capitalized. If `:lower` is used, the first letter will be in lowercase.

    ```elixir
    Inflex.Camelize.camelize("hello_world", :lower)
    # Returns: "helloWorld"
    ```

    ## Functions

    - `camelize/2`: This is the main function of the module. It takes a string and an option (`:upper` or `:lower`) and returns the CamelCase version of the string.

    - `capitalize/1`: This function takes a string and returns the string with the first letter capitalized.

    - `lowercase/1`: This function takes a string and returns the string in lowercase.


    ## Notes
    Please note that these functions are designed to work with ASCII strings. Non-ASCII characters may not be handled correctly.
    """

  @camelize_regex ~r/(?:^|[-_])|(?=[A-Z][a-z])/

    @doc """
    # Inflex.Camelize.camelize/2

    `Inflex.Camelize.camelize/2` is a function in the `Inflex.Camelize` module. This function takes a string and an option as arguments and returns the CamelCase version of the string.

    ## Examples

      iex> Inflex.Camelize.camelize("hello_world", :upper)
      "HelloWorld"

      iex> Inflex.Camelize.camelize("hello_world", :lower)
      "helloWorld"

    ## Notes
    Please note that this function is designed to work with ASCII strings. Non-ASCII characters may not be handled correctly.
    ```````
    """
  def camelize(word, option \\ :upper) do
    case Regex.split(@camelize_regex, to_string(word)) do
      words ->
        words
        |> Enum.filter(&(&1 != ""))
        |> camelize_list(option)
        |> Enum.join()
    end
  end

  defp camelize_list([], _), do: []

  defp camelize_list([h | tail], :lower) do
    [lowercase(h)] ++ camelize_list(tail, :upper)
  end

  defp camelize_list([h | tail], :upper) do
    [capitalize(h)] ++ camelize_list(tail, :upper)
  end

  def capitalize(word), do: String.capitalize(word)
  def lowercase(word), do: String.downcase(word)
end
