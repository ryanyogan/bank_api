import Config

config :eventstore,
  column_data_type: "jsonb"

config :eventstore, EventStore.Storage,
  serializer: EventStore.JsonbSerializer,
  types: EventStore.PostgresTypes,
  username: "postgres",
  password: "postgres",
  database: "bank_api_eventstore_dev",
  hostname: "localhost",
  pool_size: 10,
  pool_overflow: 5

config :bank_api, BankAPI.Repo,
  username: "postgres",
  password: "postgres",
  database: "bank_api_dev",
  hostname: "localhost",
  show_sensitive_data_on_connection_error: true,
  pool_size: 10

config :bank_api, BankAPIWeb.Endpoint,
  http: [port: 4000],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: [
    node: [
      "node_modules/webpack/bin/webpack.js",
      "--mode",
      "development",
      "--watch-stdin",
      cd: Path.expand("../assets", __DIR__)
    ]
  ]

config :bank_api, BankAPIWeb.Endpoint,
  live_reload: [
    patterns: [
      ~r"priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$",
      ~r"priv/gettext/.*(po)$",
      ~r"lib/bank_api_web/{live,views}/.*(ex)$",
      ~r"lib/bank_api_web/templates/.*(eex)$"
    ]
  ]

config :logger, :console, format: "[$level] $message\n"

config :phoenix, :stacktrace_depth, 20

config :phoenix, :plug_init_mode, :runtime
