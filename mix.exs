Code.ensure_loaded?(Hex) and Hex.start()

defmodule Inflex.Mixfile do
  use Mix.Project

  @source_url "https://github.com/nurugger07/inflex"

  def project do
    [
      app: :inflex,
      version: "2.0.0",
      elixir: ">= 1.0.0",
      deps: deps(),
      package: [
        files: ["lib", "mix.exs", "README*", "LICENSE*"],
        contributors: ["Johnny Winn"],
        licenses: ["Apache-2.0"],
        links: %{"GitHub" => @source_url},
        maintainers: ["Johnny Winn"]
      ],
      name: "Inflex",
      docs: [
        extras: ["README.md", "profile/BENCHEE.md"],
        main: "Inflex",
        source_url: @source_url,
        api_references: false,
        extra_section: []
      ],
      aliases: [
      docs: ["run profile/benchee.exs", "docs"]
      ],
      description: """
      An Elixir library for handling word inflections.
      """
    ]
  end

  def application do
    []
  end

  def deps do
    [
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false},
      {:benchee, "~> 1.0", only: :dev, optional: true},
      {:benchee_markdown, "~> 0.3", only: :dev, optional: true}
    ]
  end
end
