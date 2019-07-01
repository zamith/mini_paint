# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :mini_paint, ecto_repos: [MiniPaint.Repo]

# Configures the endpoint
config :mini_paint, MiniPaintWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "D1Lk3WXui9QoWMeIUSEP50+kQmPomLOktU0DV+ddyjlF6rugOpV/ouKHg8CRInK7",
  render_errors: [view: MiniPaintWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: MiniPaint.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

config :mini_paint, MiniPaint.Auth.Guardian,
  issuer: "MiniPaint",
  secret_key: {MiniPaint.Auth.Secret, :secret_key, []}

config :mini_paint, MiniPaint.Auth.Plug,
  module: MiniPaint.Auth.Guardian,
  error_handler: MiniPaint.Auth.ErrorHandler

config :mini_paint, :generators,
  migration: false,
  binary_id: true

config :phoenix, :template_engines,
  slim: PhoenixSlime.Engine,
  slime: PhoenixSlime.Engine

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
