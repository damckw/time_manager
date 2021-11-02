defmodule Theme01Web.UserController do
  use Theme01Web, :controller

  alias Theme01.API
  alias Theme01.API.User
  
  action_fallback Theme01Web.FallbackController

  def index(conn, _params) do
    users = API.list_users()
    render(conn, "index.json", users: users)
  end

  def createUser(conn, %{"username" => user_params, "email" => email_params}) do
    with {:ok, %User{} = user} <- API.create_user(%{username: user_params, email: email_params}) do
      conn
      |> put_status(:created)
      |> render("show.json", user: user)
    end
  end

  def getUserByID(conn, %{"id" => id}) do
    try do
      API.get_user!(id)
    rescue
      Ecto.NoResultsError -> send_resp(conn, 400, "Invalid User ID")
    end

    user = API.get_user!(id)
    render(conn, "show.json", user: user)
  end

  def getUserID(conn, map = %{"username" => username, "email" => email}) do
    user = API.get_user_by!(%{username: username, email: email})
    render(conn, "show.json", user: user)
  end

  def getUserID(conn, _) do
    users = API.list_users()
    render(conn, "index.json", users: users)
  end
  
  def updateUser(conn, %{"userID" => id, "username" => user_params, "email" => email_params}) do
    try do
      API.get_user!(id)
    rescue
      Ecto.NoResultsError -> send_resp(conn, 400, "Invalid User ID")
    end

    user = API.get_user!(id)

    with {:ok, %User{} = user} <- API.update_user(user, %{username: user_params, email: email_params}) do
      render(conn, "show.json", user: user)
    end
  end

  def deleteUser(conn, %{"userID" => id}) do
    try do
      API.get_user!(id)
    rescue
      Ecto.NoResultsError -> send_resp(conn, 400, "Invalid User ID")
    end

    user = API.get_user!(id)

    with {:ok, %User{}} <- API.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end
end
