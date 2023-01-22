defmodule Stackly.Repo do
  use Ecto.Repo,
    otp_app: :stackly,
    adapter: Ecto.Adapters.Postgres
end
