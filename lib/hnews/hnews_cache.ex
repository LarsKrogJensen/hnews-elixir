defmodule HackerNewsCache do
   use Nebulex.Cache,
    otp_app: :hnews,
    adapter: Nebulex.Adapters.Local

end
