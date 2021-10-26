defmodule Theme01.Repo.Migrations.CreateUsers do
  use Ecto.Migration


  def change do
    create table(:users) do
      add :username, :text, null: false
      add :email, :text, null: false

      timestamps()
    end
  end
end
