defmodule Piano.Repo do
  use Ecto.Repo,
    otp_app: :piano,
    adapter: Ecto.Adapters.Postgres
end
