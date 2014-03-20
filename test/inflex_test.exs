defmodule InflexTest do
  use ExUnit.Case

  use Inflex

  test :singularize do
    assert "user" == singularize("users")
    assert "sheep" == singularize("sheep")
    assert "mouse" == singularize("mice")
    assert "child" == singularize("children")

    assert "bus" == singularize("buses")
    assert "database" == singularize("databases")
    assert "shoe" == singularize("shoes")
    assert "zombie" == singularize("zombies")
    assert "virus" == singularize("viri")
    assert "goose" == singularize("geese")
  end

  test :pluralize do
    assert "users" == pluralize("user")
    assert "sheep" == pluralize("sheep")
    assert "mice" == pluralize("mouse")
    assert "children" == pluralize("child")

    assert "buses" == pluralize("bus")
    assert "databases" == pluralize("database")
    assert "shoes" == pluralize("shoe")
    assert "viri" == pluralize("virus")
    assert "geese" == pluralize("goose")
  end

  test :skip_singularize do
    assert "dog" == singularize("dog")
  end

  test :skip_pluralize do
    assert "dogs" == pluralize("dogs")
  end

  test :camelize_upper do
    assert "UpperCamelCase" == camelize("upper_camel_case")
    refute "UpperCamelCase" == camelize("upper_camel_case", :lower)
  end

  test :camelize_lower do
    assert "lowerCamelCase" == camelize("lower_camel_case", :lower)
    assert "lowerCamelCase" == camelize("Lower_camel_case", :lower)
    refute "lowerCamelCase" == camelize("lower_camel_case")
  end

  test :parameterize do
    assert "elixir-inflex" == parameterize("elixir inflex")
    assert "elixir-inflex" == parameterize("Elixir Inflex")
    assert "elixir_inflex" == parameterize("elixir inflex", "_")
    assert "elixir-inflex" == parameterize("elixir%20inflex")
  end
end
