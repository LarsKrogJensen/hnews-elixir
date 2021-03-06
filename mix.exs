defmodule Hnews.MixProject do
  use Mix.Project

  def project do
    [
      app: :hnews,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Hnews.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:jason, "~> 1.1"},
      {:httpoison, "~> 1.5.0"},
      {:nebulex, "~> 1.0"},
      {:nebulex_redis_adapter, "~> 1.0"},
      {:remix, "~> 0.0.2", only: :dev}
    ]
  end
end
