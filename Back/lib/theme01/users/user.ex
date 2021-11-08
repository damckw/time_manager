defmodule Theme01.Users.User do
  use Ecto.Schema
  use Pow.Ecto.Schema

  schema "users" do
    field :role, Ecto.Enum, values: [:user, :manager, :general_manager], default: :user

    pow_user_fields()

    timestamps()
  end
  def changeset(user_or_changeset, attrs) do
    user_or_changeset
    |> pow_changeset(attrs)
    |> Ecto.Changeset.cast(attrs, [:role])
    |> Ecto.Changeset.validate_required([:role])
  end
end
