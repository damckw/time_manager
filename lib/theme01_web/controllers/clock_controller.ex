defmodule Theme01Web.ClockController do
  use Theme01Web, :controller

  alias Theme01.API
  alias Theme01.API.Clock

  action_fallback Theme01Web.FallbackController

  def index(conn, _params) do
    clocks = API.list_clocks()
    render(conn, "index.json", clocks: clocks)
  end

  def create(conn, %{"time" => time_param, "status" => status_param, "user" => user_param}) do
    with {:ok, %Clock{} = clock} <- API.create_clock(%{time: NaiveDateTime.from_iso8601!(time_param), status: status_param, user: user_param}) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.clock_path(conn, :show, clock))
      |> render("show.json", clock: clock)
    end
  end

  def show(conn, %{"id" => id}) do
    try do
      API.get_clock!(id)
    rescue
      Ecto.NoResultsError -> send_resp(conn, 400, "Invalid Clock ID")
    end

    clock = API.get_clock!(id)
    render(conn, "show.json", clock: clock)
  end

  def update(conn, %{"id" => id, "time" => time_param, "status" => status_param, "user" => user_param}) do
    try do
      API.get_clock!(id)
    rescue
      Ecto.NoResultsError -> send_resp(conn, 400, "Invalid Clock ID")
    end
    clock = API.get_clock!(id)
    with {:ok, %Clock{} = clock} <- API.update_clock(clock, %{time: NaiveDateTime.from_iso8601!(time_param), status: status_param, user: user_param}) do
      render(conn, "show.json", clock: clock)
    end
  end

  def delete(conn, %{"id" => id}) do
    try do
      API.get_clock!(id)
    rescue
      Ecto.NoResultsError -> send_resp(conn, 400, "Invalid Clock ID")
    end
    clock = API.get_clock!(id)
    with {:ok, %Clock{}} <- API.delete_clock(clock) do
      send_resp(conn, :no_content, "")
    end
  end
end
