defmodule Theme01.Repo.Migrations.CreateClocks do
  use Ecto.Migration

  def change do
    create table(:clocks) do
      add :time, :naive_datetime, requires
      add :status, :boolean, default: false, null: false, requires
      add :user, :string, requires

      timestamps()
    end
  end
end
