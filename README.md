# Inflex [![Build Status](https://travis-ci.org/nurugger07/inflex.svg?branch=master)](https://travis-ci.org/nurugger07/inflex)

An Elixir library for handling word inflections.

## Getting Started

You can add Inflex as a dependency in your `mix.exs` file. Since it only requires Elixir and Erlang there are no other dependencies.

```elixir
def deps do
  [ { :inflex, "~> 1.10.0" } ]
end
```

If you are not using [hex](http://hex.pm) you can add the dependency using the github repo.

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

Some other special cases are handled for nouns ending in -o and  -y

```elixir


iex(1)> Inflex.pluralize("piano")
"pianos"

iex(2)> Inflex.pluralize("hero")
"heroes"

iex(3)> Inflex.pluralize("butterfly")
"butterflies"

iex(4)> Inflex.pluralize("monkey")
"monkeys"

```

### Inflect

``` elixir
iex(1)> Inflex.inflect("child", 1)
"child"

iex(2)> Inflex.inflect("child", 2)
"children"
```

### Camelize & Pascalize

Inflex also camelizes or pascalizes strings and atoms.

```elixir

iex(1)> Inflex.camelize(:upper_camel_case)
"UpperCamelCase"

iex(2)> Inflex.camelize("pascal-case", :lower)
"pascalCase"

```

### Parameterize

Strings can be parameterized easily.

```elixir

iex(1)> Inflex.parameterize("String for parameter")
"string-for-parameter"

iex(2)> Inflex.parameterize("String with underscore", "_")
"string_with_underscore"

```

### Underscore

Makes an underscored, lowercase form from a string or atom.

```elixir

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
