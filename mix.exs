defmodule Inflex.Mixfile do
  use Mix.Project

  def project do
    [ app: :inflex,
      version: "0.2.0",
      elixir: ">= 0.12.4",
      deps: deps ]
  end

  # Configuration for the OTP application
  def application do
    [mod: { Inflex, [] }]
  end

  defp deps do
    []
  end
end
