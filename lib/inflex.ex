defmodule Inflex do
  use Application.Behaviour

  use Inflex.Camelize
  use Inflex.Pluralize
  use Inflex.Parameterize
  use Inflex.Underscore

  def start(_type, _args) do
    Inflex.Supervisor.start_link
  end

  defmacro __using__([]) do
    quote do
      use Inflex.Camelize
      use Inflex.Pluralize
      use Inflex.Parameterize
      use Inflex.Underscore
    end
  end
end
