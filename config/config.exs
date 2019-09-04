use Mix.Config

config :bank_api,
  namespace: BankAPI,
  ecto_repos: [BankAPI.Repo]

# Configures the endpoint
config :bank_api, BankAPIWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "NDh4UNGWqxX1GxYt7A1bSlzNssljwfOprHME3LYu43L3U5MvmjhYrL5Bpr3FIFTy",
  render_errors: [view: BankAPIWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: BankAPI.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :commanded,
  event_store_adapter: Commanded.EventStore.Adapters.EventStore

config :commanded_ecto_projections,
  repo: BankAPI.Repo

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
