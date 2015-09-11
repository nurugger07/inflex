defmodule Inflex do
  defdelegate [camelize(word), camelize(word, option)], to: Inflex.Camelize
  defdelegate [singularize(word), pluralize(word), inflect(word, count)], to: Inflex.Pluralize
  defdelegate [parameterize(word), parameterize(word, option)], to: Inflex.Parameterize
  defdelegate underscore(word), to: Inflex.Underscore
end
