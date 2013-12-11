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
  end

  test :skip_singularize do
    assert "dog" == singularize("dog")
  end
end
