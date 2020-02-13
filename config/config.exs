use Mix.Config

config :bank_api,
  namespace: BankAPI,
  ecto_repos: [BankAPI.Repo]

config :bank_api, BankAPIWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "8Qs75GFvmpJeCrczQI9cVTV2LpvC7056v3Cu/IkEmDNnCbAmBeEarPYt4x8oIdAz",
  render_errors: [view: BankAPIWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: BankAPI.PubSub, adapter: Phoenix.PubSub.PG2]

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :json_library, Jason

config :commanded,
  event_store_adapter: Commanded.EventStore.Adapters.EventStore

import_config "#{Mix.env()}.exs"
