use Mix.Config

config :bank_api, BankAPI.Repo,
  username: "postgres",
  password: "postgres",
  database: "bank_api_readstore_prod",
  hostname: "localhost",
  show_sensitive_data_on_connection_error: false,
  pool_size: 10

# config :eventstore,
#   column_data_type: "jsonb"

# config :eventstore, EventStore.Storage,
#   serializer: EventStore.JsonbSerializer,
#   types: EventStore.PostgresTypes,
#   username: "admin",
#   password: "changeit",
#   hostname: "localhost",
#   port: 1113,
#   pool_size: 10,
#   pool_overflow: 5

config :bank_api, BankAPIWeb.Endpoint, server: true

config :logger, level: :info

# docker run -it --rm \
# -e READSTORE_URL=ecto://postgres:postgres@readstore/bank_api_readstore_prod \
# -e RELEASE_COOKIE=foo \
# -e SECRET_KEY_BASE=foo \
# -e SERVICE_NAME=bank_api \
# -e APP_HOST=localhost \
# -e PORT=4000 \
# --network bank-api-net \
# --publish 4000:4000 \
# bank_api:latest
