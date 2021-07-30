defmodule Chirpp.Repo do
  use Ecto.Repo,
    otp_app: :chirpp,
    adapter: Ecto.Adapters.Postgres

  #alias Chirpp.User
end
