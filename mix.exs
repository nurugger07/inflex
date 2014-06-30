Code.ensure_loaded?(Hex) and Hex.start

defmodule Inflex.Mixfile do
  use Mix.Project

  def project do
    [
      app: :inflex,
      version: "0.2.4",
      elixir: ">= 0.14.0",
      deps: [],
      package: [
        files: ["lib", "mix.exs", "README*", "LICENSE*"],
        contributors: ["Johnny Winn"],
        licenses: ["Apache 2.0"],
        links: [ github: "https://github.com/nurugger07/inflex" ]
      ],
      description: """
      An Elixir library for handling word inflections.
      """,
    ]
  end

  # Configuration for the OTP application
  def application do
    []
  end
end
