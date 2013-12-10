defmodule InflexTest do
  use ExUnit.Case

  import Inflex

  test :singularize do
    assert "sheep" == singularize("sheep")
    assert "mouse" == singularize("mice")
  end

  test :replace do
    assert "mouse" == replace("mice", [ { "mouse", "mice" } ])
    assert "men" == replace("man", [ { "man", "men" } ])
    assert "person" == replace("people", [ { "person", "people" } ])
  end

  test :replace_with_matcher do
    assert "dog" == replace("dogs", [ { %r/s$/, "" } ])
  end
end
