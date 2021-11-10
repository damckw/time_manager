defmodule Theme01Web.UserController do
  use Theme01Web, :controller

  alias Theme01.Users.User
  alias Ecto.Changeset
  alias Plug.Conn
  alias Theme01Web.ErrorHelpers
  alias Theme01.Auth.UserRegistration
  alias Theme01.Repo

  action_fallback Theme01Web.FallbackController


  @spec createUser(Conn.t(), UserRegistration.t()) :: Conn.t()
  def createUser(conn, user_registration_command) do
    with {:ok, _user, conn} <- conn |> Pow.Plug.create_user(user_registration_command) do
      json(conn, %{token: conn.private[:api_access_token]})
    else
      {:error, changeset, conn} ->
        errors = Changeset.traverse_errors(changeset, &ErrorHelpers.translate_error/1)
        conn
        |> put_status(500)
        |> json(%{error: %{status: 500, message: "Couldn't create user", errors: errors}})
    end
  end

  def getUserByID(conn, %{"userID" => id}) do
    try do
      Repo.get_by!(User, %{id: id})
    rescue
      Ecto.NoResultsError -> send_resp(conn, 400, "Invalid User ID")
    end

    user = Repo.get_by!(User, %{id: id})
    render(conn, "show.json", user: user)
  end

  def getUserID(conn, %{"username" => username, "email" => email}) do
    user = Repo.get_by!(User, %{username: username, email: email})
    render(conn, "show.json", user: user)
  end

  def getUserID(conn, _) do
    users = Repo.all(User)
    render(conn, "index.json", users: users)
  end
  
  def updateUser(conn, %{"userID" => id, "username" => user_params, "email" => email_params}) do
    try do
      Repo.get_by!(User, %{id: id})
    rescue
      Ecto.NoResultsError -> send_resp(conn, 400, "Invalid User ID")
    end

    user = Repo.get_by!(User, %{id: id})

    with {:ok, %User{} = user} <- 
      # API.update_user(user, %{username: user_params, email: email_params})
      user
      |> User.changeset(%{username: user_params, email: email_params})
      |> Repo.update()
      do
      render(conn, "show.json", user: user)
    end
  end

  def deleteUser(conn, %{"userID" => id}) do
    try do
      Repo.get_by!(User, %{id: id})
    rescue
      Ecto.NoResultsError -> send_resp(conn, 400, "Invalid User ID")
    end

    user = Repo.get_by!(User, %{id: id})

    with {:ok, %User{}} <- Repo.delete(user) do
      send_resp(conn, :no_content, "")
    end
  end
end
