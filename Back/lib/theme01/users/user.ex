defmodule Theme01.Users.User do
  use Ecto.Schema
  use Pow.Ecto.Schema

  alias Theme01.Repo
  
  schema "users" do
    field :role, Ecto.Enum, values: [:user, :manager, :general_manager], default: :user
    field :username, :string, null: false
  
    pow_user_fields()

    timestamps()
  end
  def changeset(user_or_changeset, attrs) do
    user_or_changeset
    |> pow_changeset(attrs)
    |> Ecto.Changeset.cast(attrs, [:role, :username])
    |> Ecto.Changeset.validate_required([:role])
  end
  def create(attrs) do
    %__MODULE__{}
    |> pow_changeset(attrs)
    |> case do
      changeset = %{valid?: true} ->
        Repo.insert(changeset)
      %{valid?: false, errors: e} ->
        {:error, e}
       end
  end
end
