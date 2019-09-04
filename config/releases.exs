import Config

service_name = System.fetch_env!("SERVICE_NAME")
db_url = System.fetch_env!("DB_URL")
secret_key_base = System.fetch_env!("SECRET_KEY_BASE")
port = System.fetch_env!("PORT")

config :bank_api, BankAPI.Repo, url: db_url

config :bank_api, BankAPIWeb.Endpoint,
  http: [port: port],
  secret_key_base: secret_key_base,
  url: [host: {:system, "APP_HOST"}, port: {:system, "PORT"}]

config :peerage,
  via: Peerage.Via.Dns,
  dns_name: service_name,
  app_name: "bank_api"
