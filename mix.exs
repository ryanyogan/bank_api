defmodule BankAPI.MixProject do
  use Mix.Project

  def project do
    [
      app: :bank_api,
      version: "0.1.0",
      elixir: "~> 1.9",
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
      extra_applications: [:logger, :runtime_tools, :peerage]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp deps do
    [
      {:phoenix, "~> 1.4.9"},
      {:phoenix_pubsub, "~> 1.1"},
      {:phoenix_ecto, "~> 4.0"},
      {:ecto_sql, "~> 3.1"},
      {:postgrex, ">= 0.0.0"},
      {:gettext, "~> 0.11"},
      {:jason, "~> 1.0"},
      {:plug_cowboy, "~> 2.0"},

      # Event Sourcing
      {:commanded, "~> 0.18"},
      # {:eventstore, "~> 0.16.1", runtime: Mix.env() != :test},
      # {:commanded_eventstore_adapter, "~> 0.5", runtime: Mix.env() != :test},
      {:commanded_ecto_projections, "~> 0.8"},
      {:commanded_extreme_adapter, "~> 0.8"},

      # Testing & Utilities
      {:skooma, "~> 0.2.0"},

      # Infrastructure & k8s
      {:peerage, "~> 1.0"}
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
