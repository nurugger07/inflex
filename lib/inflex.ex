defmodule Inflex do
  use Application.Behaviour

  use Inflex.Camelize
  use Inflex.Pluralize

  def start(_type, _args) do
    Inflex.Supervisor.start_link
  end

  defmacro __using__([]) do
    quote do
      use Inflex.Camelize
      use Inflex.Pluralize
    end
  end
end
