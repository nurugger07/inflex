# Inflex

An Elixir library for handling word inflections. Currently, the Inflex can singularize and pluralize words.

## Using

To use Inflex, add a dependency to your project mix file

``` elixir

  def deps do
    [ { :inflex, github: "nurugger07/inflex" } ]
  end

```

Then run `mix deps.get` in the shell to fetch and compile the dependencies.

## Examples

Here are some basic examples from `iex`:

``` elixir

iex(1)> Inflex.singularize("dogs")
"dog"

iex(2)> Inflex.pluralize("dog")
"dogs"

iex(3)> Inflex.singularize("people")
"person"

iex(4)> Inflex.pluralize("person")
"people"

```

To incorporate Inflex in your modules, use `import`.

``` elixir

  defmodule YourModule do
    import Inflex

    def make_singular(word), do: singularize(word)

  end

```

## Contributing

All pull requests will be reviewed for inclusion but must include tests.
