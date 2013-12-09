defmodule InflexTest do
  use ExUnit.Case

  import Inflex

  test :singularize do
    assert "dog" == singularize("dogs")
    assert "sheep" == singularize("sheep")
  end
end
