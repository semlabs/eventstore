defmodule Mix.Tasks.EventStore.Migrate do
  use Mix.Task

  def run(_args) do
    Mix.Tasks.Ecto.Migrate.run([])
  end
end
