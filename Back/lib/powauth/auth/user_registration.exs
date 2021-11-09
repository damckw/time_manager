defmodule Theme01.Auth.UserRegistration do
  defstruct [:email, :password, :password_confirmation, :role]

  @type t() :: %__MODULE__{}
end