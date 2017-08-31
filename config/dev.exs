use Mix.Config

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

config :eventstore, EventStore.Storage,
  serializer: EventStore.TermSerializer,
  username: "postgres",
  password: "postgres",
  database: "eventstore_dev",
  hostname: "localhost",
  pool_size: 10,
  pool_overflow: 5

config :eventstore,
  ecto_repos: [EventStore.StorageAdapters.Ecto.Repo],
  generators: [binary_id: true]

config :eventstore, EventStore.StorageAdapters.Ecto.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "eventstore_dev",
  hostname: "localhost",
  port: 5432,
  pool_size: 10

config :eventstore,
    repo: EventStore.StorageAdapters.Ecto.Repo 
