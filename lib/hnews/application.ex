defmodule Hnews.Application do
  use Application

  def start(_type, _args) do
    children = [
      HackerNewsCache,
      HackerNewsCache.Local,
      HackerNewsCache.Redis
    ]

    opts = [strategy: :one_for_one, name: Hnews.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
