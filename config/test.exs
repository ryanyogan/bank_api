import Config

config :commanded,
  event_store_adapter: Commanded.EventStore.Adapters.InMemory

config :commanded, Commanded.EventStore.Adapters.InMemory,
  serializer: Commanded.Serialization.JsonSerializer

config :bank_api, BankAPIWeb.Endpoint,
  http: [port: 4002],
  server: false

config :logger, level: :warn

import_config "test.secret.exs"
