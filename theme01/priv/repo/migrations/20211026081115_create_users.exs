defmodule Theme01.Repo.Migrations.CreateUsers do
  use Ecto.Migration


  def change do
    create table(:users) do
      add :username, :text, requires
      add :email, :text, requires

      timestamps()
    end
  end
end
