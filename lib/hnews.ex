defmodule Hnews do
  @moduledoc """
  Documentation for Hnews.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Hnews.hello()
      :world

  """
  def hello do
    sum(1, 2)
    :world
  end

  @spec sum(number(), number()) :: number()
  def sum(a, b) do
    a + b
  end
end
