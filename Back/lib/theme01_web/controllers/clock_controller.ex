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

  def setClockByUserID(conn, %{"userID" => id}) do
    try do
      clock = Repo.get_by!(Clock, %{user: id, status: true})
      API.create_working_time(%{
        start: clock.time,
        end: NaiveDateTime.utc_now(),
        user: clock.user
        })
      with {:ok, %Clock{} = clock} <- API.update_clock(clock, %{status: false}) do
          render(conn, "show.json", %{clock: clock})
      end
    rescue
      Ecto.NoResultsError ->
        try do
          clock = Repo.get_by!(Clock, %{user: id, status: false})
          with {:ok, %Clock{} = clock} <- API.update_clock(clock, %{time: NaiveDateTime.utc_now(), status: true}) do
            render(conn, "show.json", %{clock: clock})
          end
        rescue
          Ecto.NoResultsError ->
          with {:ok, %Clock{} = clock} <- API.create_clock(%{time: NaiveDateTime.utc_now(), status: true, user: id}) do
            render(conn, "show.json", %{clock: clock})
          end
        end
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