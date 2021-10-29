defmodule Theme01Web.WorkingTimeController do
  use Theme01Web, :controller

  alias Theme01.API
  alias Theme01.API.WorkingTime

  action_fallback Theme01Web.FallbackController

  def index(conn, _params) do
    workingtimes = API.list_workingtimes()
    render(conn, "index.json", workingtimes: workingtimes)
  end
  def create(conn, _ \\ :default)
  def create(conn, %{"start" => start_params, "end" => end_params, "user" => user_id}) do
    with {:ok, %WorkingTime{} = working_time} <- API.create_working_time(%{
      start: NaiveDateTime.from_iso8601!(start_params),
      end: NaiveDateTime.from_iso8601!(end_params),
      user: user_id
      }) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.working_time_path(conn, :show, working_time))
      |> render("show.json", working_time: working_time)
    end
  end
  def create(conn, _) do
    send_resp(conn, 400, "Invalid arguments")
  end
  def show(conn, %{"id" => id}) do
    try do
      API.get_working_time!(id)
    rescue
      Ecto.NoResultsError -> send_resp(conn, 400, "Invalid Working Time ID")
    end
    
    working_time = API.get_working_time!(id)
    render(conn, "show.json", working_time: working_time)
  end

  def update(conn, %{"id" => id, "start" => start_params, "end" => end_params, "user" => user_id}) do
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

  def delete(conn, %{"id" => id}) do
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
