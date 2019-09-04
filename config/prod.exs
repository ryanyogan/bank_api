use Mix.Config

config :bank_api, BankAPI.Repo,
  username: "postgres",
  password: "postgres",
  database: "bank_api_readstore_prod",
  hostname: "localhost",
  show_sensitive_data_on_connection_error: false,
  pool_size: 10

config :eventstore,
  column_data_type: "jsonb"

config :eventstore, EventStore.Storage,
  serializer: EventStore.JsonbSerializer,
  types: EventStore.PostgresTypes,
  username: "postgres",
  password: "postgres",
  database: "bank_api_eventstore_prod",
  hostname: "localhost",
  pool_size: 10,
  pool_overflow: 5

config :bank_api, BankAPIWeb.Endpoint, server: true

config :logger, level: :info
