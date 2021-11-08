defmodule Theme01.Repo.Migrations.CreateUsers do
  use Ecto.Migration
  alias Theme01.Users.UserRole

  def change do
    create table(:users) do
      add :email, :string, null: false
      add :password_hash, :string, redact: true
      add ::username, :string, null: false

      timestamps()
    end

    create unique_index(:users, [:email])
    end
end
