import Config

config :commanded,
  event_store_adapter: Commanded.EventStore.Adapters.InMemory

config :commanded, Commanded.EventStore.Adapters.InMemory,
  serializer: Commanded.Serialization.JsonSerializer

config :bank_api, BankAPI.Repo,
  username: "postgres",
  password: "postgres",
  database: "bank_api_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

config :bank_api, BankAPIWeb.Endpoint,
  http: [port: 4002],
  server: false

config :logger, level: :warn
