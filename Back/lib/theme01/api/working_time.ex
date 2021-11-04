defmodule Theme01.API.WorkingTime do
  use Ecto.Schema
  import Ecto.Changeset

  schema "workingtimes" do
    field :end, :naive_datetime, null: true, default: nil
    field :start, :naive_datetime, null: true, default: nil
    field :user, :id

    timestamps()
  end

  @doc false
  def changeset(working_time, attrs) do
    working_time
    |> cast(attrs, [:start, :end, :user])
    |> foreign_key_constraint(:user)
    |> validate_required([:start, :user])
  end
end
