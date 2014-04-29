defmodule Inflex.Mixfile do
  use Mix.Project

  def project do
    [ app: :inflex,
      version: "0.2.0",
      elixir: ">= 0.13.0",
      deps: [] ]
  end

  # Configuration for the OTP application
  def application do
    [mod: { Inflex, [] }]
  end
end
