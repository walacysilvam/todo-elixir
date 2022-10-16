defmodule Crosstodo.Repo do
  use Ecto.Repo,
    otp_app: :crosstodo,
    adapter: Ecto.Adapters.Postgres
end
