# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :chirpp,
  ecto_repos: [Chirpp.Repo]

# Configures the endpoint
config :chirpp, ChirppWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "8oE3arvQBhPaOo9yH8MRuDnAmm9AyAvSxqPWrvaMsINpu8puqKppn/Sw+K6ry+a5",
  render_errors: [view: ChirppWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Chirpp.PubSub,
  live_view: [signing_salt: "o9lLjXfp"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
