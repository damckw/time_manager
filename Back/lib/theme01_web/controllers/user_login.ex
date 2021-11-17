defmodule Theme01Web.Controllers.UserLogin do
  use Theme01Web, :controller

  alias Plug.Conn
  alias Theme01Web.Auth.UserPassLogin

  @spec login(Conn.t(), UserPassLogin.t()) :: Conn.t()
  def login(conn, user_pass_login) do
    with {:ok, conn} <- conn |> Pow.Plug.authenticate_user(user_pass_login) do
      json(conn, %{
        data: %{
          token: conn.private[:api_access_token],
          role: conn.private[:role],
          id: conn.private[:id],
          username: conn.private[:username],
          email: conn.private[:email]
          }})
    else
      {:error, conn} ->
        conn
        |> put_status(401)
        |> json(%{error: %{status: 401, message: "Invalid email or password"}})
    end
  end

end