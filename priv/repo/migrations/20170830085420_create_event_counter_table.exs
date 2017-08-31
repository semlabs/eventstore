defmodule EventStore.StorageAdapters.Ecto.Repo.Migrations.CreateEventCounterTable do
  use Ecto.Migration

  def change do
    create table(:event_counter, primary_key: false) do
      add :event_id, :bigint, primary_key: true, null: false
    end 

    execute """
    INSERT INTO event_counter (event_id) VALUES (0);
    """

    Application.get_env(:eventstore, :repo).__adapter__()
    |> create_rules()
  end

  defp create_rules(Ecto.Adapters.Postgres) do
    execute """
    CREATE RULE no_insert_event_counter AS ON INSERT TO event_counter DO INSTEAD NOTHING;
    """

    execute """
    CREATE RULE no_delete_event_counter AS ON DELETE TO event_counter DO INSTEAD NOTHING;
    """
  end
  defp create_rules(_), do: :ok
end
