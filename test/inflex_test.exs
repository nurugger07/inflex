defmodule InflexTest do
  use ExUnit.Case

  import Inflex

  test :singularize do
    assert "user" == singularize("users")
    assert "sheep" == singularize("sheep")
    assert "mouse" == singularize("mice")
    assert "child" == singularize("children")

    assert "bus" == singularize("buses")
    assert "database" == singularize("databases")
    assert "shoe" == singularize("shoes")
    assert "zombie" == singularize("zombies")
  end

  test :pluralize do
    assert "users" == pluralize("user")
    assert "sheep" == pluralize("sheep")
    assert "mice" == pluralize("mouse")
    assert "children" == pluralize("child")

    assert "buses" == pluralize("bus")
    assert "databases" == pluralize("database")
    assert "shoes" == pluralize("shoe")
  end

  test :skip_singularize do
    assert "dog" == singularize("dog")
  end

  test :skip_pluralize do
    assert "dogs" == pluralize("dogs")
  end
end
