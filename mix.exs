defmodule BankAPI.MixProject do
  use Mix.Project

  @app_version "0.0.1"
  @elixir_version "~> 1.9"

  def project do
    [
      app: :bank_api,
      version: @app_version,
      elixir: @elixir_version,
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  def application do
    [
      mod: {BankAPI.Application, []},
      extra_applications: [:logger, :runtime_tools, :commanded]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp deps do
    [
      {:phoenix, "~> 1.4.10"},
      {:phoenix_pubsub, "~> 1.1"},
      {:phoenix_ecto, "~> 4.0"},
      {:ecto_sql, "~> 3.1"},
      {:postgrex, ">= 0.0.0"},
      {:phoenix_html, "~> 2.11"},
      {:phoenix_live_reload, "~> 1.2", only: :dev},
      {:gettext, "~> 0.11"},
      {:jason, "~> 1.0"},
      {:plug_cowboy, "~> 2.0"},
      {:commanded, "~> 0.18"},
      {:eventstore, "~> 0.16.1", runtime: Mix.env() != :test},
      {:commanded_eventstore_adapter, "~> 0.5", runtime: Mix.env() != :test},
      {:commanded_ecto_projections, "~> 0.8"},
      {:skooma, "~> 0.2.0"}
    ]
  end

  defp aliases do
    [
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      test: ["ecto.create --quiet", "ecto.migrate", "test"]
    ]
  end
end
