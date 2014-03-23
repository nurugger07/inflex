# Inflex

An Elixir library for handling word inflections. 

## Getting Started

To use Inflex, add a dependency to your project mix file

``` elixir

  def deps do
    [ { :inflex, github: "nurugger07/inflex" } ]
  end

```

Then run `mix deps.get` in the shell to fetch and compile the dependencies.

To incorporate Inflex in your modules, use `import`.

``` elixir

  defmodule YourModule do
    import Inflex

    def make_singular(word), do: singularize(word)

  end

```

## Examples

### Singularize & Pluralize

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

### Camelize & Pascalize

Inflex also camelizes or pascalizes strings and atoms.

```

iex(1)> Inflex.camelize(:upper_camel_case)
"UpperCamelCase"

iex(2)> Inflex.camelize("pascal-case", :lower)
"pascalCase"

```

### Parameterize

Strings can be parameterized easily.

```

iex(1)> Inflex.parameterize("String for parameter")
"string-for-parameter"

iex(2)> Inflex.camelize("String with underscore", "_")
"string_with_underscore"

```

### Underscore

Makes an underscored, lowercase form from a string or atom.

```

iex(1)> Inflex.underscore("UpperCamelCase")
"upper_camel_case"

iex(2)> Inflex.underscore("pascalCase")
"pascal_case"

iex(3)> Inflex.underscore(UpperCamelCase)
"upper_camel_case"

iex(4)> Inflex.underscore(:pascalCase)
"pascal_case"

```

## Contributing

All pull requests will be reviewed for inclusion but must include tests.
