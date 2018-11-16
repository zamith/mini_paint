use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :mini_paint, MiniPaintWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :mini_paint, MiniPaint.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "mini_paint_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
