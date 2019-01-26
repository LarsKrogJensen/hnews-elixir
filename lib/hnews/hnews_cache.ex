defmodule HackerNewsCache do
  use Nebulex.Cache,
    otp_app: :hnews,
    adapter: Nebulex.Adapters.Multilevel

  defmodule Local do
    use Nebulex.Cache,
      otp_app: :hnews,
      adapter: Nebulex.Adapters.Local
  end

  defmodule Redis do
    use Nebulex.Cache,
      otp_app: :hnews,
      adapter: NebulexRedisAdapter
  end
end
