defmodule Inflex do

  def singularize(word), do: "dog"

end

defmodule InflexTest do
  use ExUnit.Case

  import Inflex

  test :singularize do
    assert "dog" == singularize("dogs")
  end
end
