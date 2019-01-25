defmodule HnewsTest do
  use ExUnit.Case
  doctest Hnews

  test "greets the world" do
    assert Hnews.hello() == :world
  end
end
