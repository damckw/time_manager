defmodule Theme01Web.WorkingTimeController do
  use Theme01Web, :controller

  alias Theme01.API
  alias Theme01.API.WorkingTime
  alias Theme01.Repo

  import Ecto.Query
  
  action_fallback Theme01Web.FallbackController

  def index(conn, _params) do
    workingtimes = API.list_workingtimes()
    render(conn, "index.json", workingtimes: workingtimes)
  end

  def createWorkingTimeByUserID(conn, %{"userID" => user_id, "start" => start_params}) do
    with {:ok, %WorkingTime{} = working_time} <- API.create_working_time(%{
      start: NaiveDateTime.from_iso8601!(start_params),
      user: user_id
      }) do
      conn
      |> put_status(:created)
      |> render("show.json", working_time: working_time)
    end
  end

  def createWorkingTimeByUserID(conn, %{"userID" => user_id, "start" => start_params, "end" => end_params}) do
    with {:ok, %WorkingTime{} = working_time} <- API.create_working_time(%{
      start: NaiveDateTime.from_iso8601!(start_params),
      end: NaiveDateTime.from_iso8601!(end_params),
      user: user_id
      }) do
      conn
      |> put_status(:created)
      |> render("show.json", working_time: working_time)
    end
  end

  def getWorkingTime(conn, %{"userID" => id, "start" => start_param, "end" => end_param}) do
    try do
      Repo.all(from u in WorkingTime, where: u.user == ^id, where: u.start > ^NaiveDateTime.from_iso8601!(start_param), where: u.end < ^NaiveDateTime.from_iso8601!(end_param))
    rescue
      Ecto.NoResultsError -> send_resp(conn, 400, "Invalid Request")
    end
    
    workingtimes = Repo.all(from u in WorkingTime, where: u.user == ^id, where: u.start > ^NaiveDateTime.from_iso8601!(start_param), where: u.end < ^NaiveDateTime.from_iso8601!(end_param))
    
    if workingtimes == [] do
      send_resp(conn, 400, "Invalid Request Working Times not found")
    end
    render(conn, "index.json", workingtimes: workingtimes)
  end

  def getWorkingTime(conn, %{"userID" => id}) do
    try do
      API.get_working_time!(id)
    rescue
      Ecto.NoResultsError -> send_resp(conn, 400, "Invalid Working Time ID")
    end
    
    working_time = API.get_working_time!(id)
    render(conn, "show.json", working_time: working_time)
  end

  

  def updateWorkingTimeByID(conn, %{"id" => id, "start" => start_params, "end" => end_params, "user" => user_id}) do
    try do
      API.get_working_time!(id)
    rescue
      Ecto.NoResultsError -> send_resp(conn, 400, "Invalid Working Time ID")
    end

    working_time = API.get_working_time!(id)

    with {:ok, %WorkingTime{} = working_time} <- API.update_working_time(working_time,%{
      start: NaiveDateTime.from_iso8601!(start_params),
      end: NaiveDateTime.from_iso8601!(end_params),
      user: user_id
      }) do
      render(conn, "show.json", working_time: working_time)
    end
  end

  def deleteWorkingTimeByID(conn, %{"id" => id}) do
    try do
      API.get_working_time!(id)
    rescue
      Ecto.NoResultsError -> send_resp(conn, 400, "Invalid Working Time ID")
    end

    working_time = API.get_working_time!(id)

    with {:ok, %WorkingTime{}} <- API.delete_working_time(working_time) do
      send_resp(conn, :no_content, "")
    end
  end
end
