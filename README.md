# Inflex

<!-- MDOC !-->

[![Build Status](https://travis-ci.org/nurugger07/inflex.svg?branch=master)](https://travis-ci.org/nurugger07/inflex)
[![Module Version](https://img.shields.io/hexpm/v/inflex.svg)](https://hex.pm/packages/inflex)
[![Hex Docs](https://img.shields.io/badge/hex-docs-lightgreen.svg)](https://hexdocs.pm/inflex/)
[![Total Download](https://img.shields.io/hexpm/dt/inflex.svg)](https://hex.pm/packages/inflex)
[![License](https://img.shields.io/hexpm/l/inflex.svg)](https://github.com/nurugger07/inflex/blob/master/LICENSE)
[![Last Updated](https://img.shields.io/github/last-commit/nurugger07/inflex.svg)](https://github.com/nurugger07/inflex/commits/master)


An Elixir library for handling word inflections.

## Getting Started

You can add Inflex as a dependency in your `mix.exs` file. Since it only requires Elixir and Erlang there are no other dependencies.

```elixir
def deps do
  [
    {:inflex, "~> 2.0.0"}
  ]
end
```

If you are not using [hex](http://hex.pm) you can add the dependency using the GitHub repository.

```elixir
def deps do
  [
    {:inflex, github: "nurugger07/inflex"}
  ]
end
```

Then run `mix deps.get` in the shell to fetch and compile the dependencies.

To incorporate Inflex in your modules, use `import`.

```elixir
defmodule Blog do
  import Inflex

  def greeting(count), do: "You are the #{ordinalize(count)} visitor!"

end
```

## Examples

### Singularize & Pluralize

Here are some basic examples from `iex`:

```elixir

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

```elixir
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

## License

Copyright (c) 2013 Johnny Winn

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at [http://www.apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0)

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
