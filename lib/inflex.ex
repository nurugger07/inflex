defmodule Inflex do
  use Inflex.Camelize
  use Inflex.Pluralize
  use Inflex.Parameterize
  use Inflex.Underscore

  defmacro __using__([]) do
    quote do
      use Inflex.Camelize
      use Inflex.Pluralize
      use Inflex.Parameterize
      use Inflex.Underscore
    end
  end
end
