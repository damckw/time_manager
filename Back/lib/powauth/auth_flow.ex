defmodule Theme01.Auth.AuthFlow do
  use Pow.Plug.Base

  require Logger

  alias Plug.Conn
  alias Theme01.Auth.Token

  @impl true
  def fetch(conn, _config) do
    with {:ok, jwt_token} <- read_token(conn),
         {:ok, claims} <- validate_token(jwt_token) do
      conn =
        conn
        |> Conn.put_private(:api_access_token, jwt_token)
        |> Conn.put_private(:user_id, claims["user_id"])
      {conn, %{"token" => jwt_token}}
    else
      _any -> {conn, nil}
    end
  end

  @impl true
  def create(conn, user, _config) do
    claims = %{"user_id" => user.id, "x_csrf_token" => Plug.CSRFProtection.get_csrf_token()}
    generated_token = Token.generate_and_sign!(claims)
    conn = 
      conn 
      |> Conn.put_private(:api_access_token, generated_token)
      |> Conn.put_private(:role, user.role)
      |> Conn.put_private(:id, user.id)
      |> Conn.put_private(:username, user.username)
      |> Conn.put_private(:email, user.email)
    {conn, user}
  end

  @impl true
  def delete(conn, _config) do
    conn
  end

  @spec read_token(Conn.t()) :: {atom(), any()}
  defp read_token(conn) do
    case Conn.get_req_header(conn, "authorization") do
      [token | _rest] -> {:ok, token |> String.replace("Bearer", "") |> String.trim()}
      _any -> {:error, "No Auth token found"}
    end
  end

  @spec validate_token(binary()) :: {atom(), any()}
  defp validate_token(jwt_token),
    do: Token.verify_and_validate(jwt_token)

end