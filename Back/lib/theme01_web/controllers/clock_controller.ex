defmodule Theme01Web.ClockController do
  use Theme01Web, :controller

  alias Theme01.API
  alias Theme01.API.Clock
  alias Theme01.Repo

  action_fallback Theme01Web.FallbackController

  def index(conn, _params) do
    clocks = Repo.all(Clock)
    render(conn, "index.json", clocks: clocks)
  end

  def setClockByUserID(conn, %{"userID" => id, "time" => time_param, "status" => status_param}) do
    try do
      Repo.get_by(Clock, %{user: id})
    rescue
      Ecto.NoResultsError ->
        with {:ok, %Clock{} = clock} <- API.create_clock(%{time: NaiveDateTime.from_iso8601!(time_param), status: status_param}) do
          conn
          |> put_status(:created)
          |> put_resp_header("location", Routes.clock_path(conn, :show, clock))
          |> render("show.json", clock: clock)
        end
    end
  
    clock = Repo.get_by(Clock, %{user: id})

    with {:ok, %Clock{} = clock} <- API.update_clock(clock, %{time: NaiveDateTime.from_iso8601!(time_param), status: status_param}) do
      render(conn, "show.json", clock: clock)
    end
  end

  def getClockByUserID(conn, %{"userID" => id}) do
    try do
      Repo.get_by(Clock, %{user: id})
    rescue
      Ecto.NoResultsError -> send_resp(conn, 400, "Invalid User ID")
    end

    clock = Repo.get_by(Clock, %{user: id})
    render(conn, "show.json", clock: clock)
  end
end