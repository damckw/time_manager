defmodule Theme01Web.Router do
  use Theme01Web, :router
  
  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {Theme01Web.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Theme01Web do
    pipe_through :browser

    get "/", PageController, :index
  end

  scope "/api", Theme01Web do
    pipe_through :api

    get "/users", UserController, :getUserID
    get "/users/:userID", UserController, :getUserByID
    post "/users", UserController, :createUser
    put "/users/:userID", UserController, :updateUser
    delete "/users/:userID", UserController, :deleteUser

    get "/workingtimes/:userID", WorkingTimeController, :getWorkingTime
    get "/workingtimes/:id", WorkingTimeController, :getWorkingTime
    post "/workingtimes/:userID", WorkingTimeController, :createWorkingTimeByUserID
    put "/workingtimes/:id", WorkingTimeController, :updateWorkingTimeByID
    delete "/workingtimes/:id", WorkingTimeController, :deleteWorkingTimeByID

    get "/clocks/:userID", ClockController, :getClocksByUserID
    post "/clocks/:userID", ClockController, :createClockByUserID
  
    # TODO
    # GET method : http://localhost:4000/api/users?email=XXX&username=YYY
    # GET method : http://localhost:4000/api/users/:userID
    # POST method : http://localhost:4000/api/users
    # PUT method : http://localhost:4000/api/users/:userID
    # DELETE method : http://localhost:4000/api/users/:userID

    #  a GET (ALL) method : http://localhost:4000/api/workingtimes/:userID?start=XXX&end=YYY
    #  a GET (ONE) method : http://localhost:4000/api/workingtimes/:id
    #  a POST method : http://localhost:4000/api/workingtimes/:userID
    #  a PUT method : http://localhost:4000/api/workingtimes/:id
    #  a DELETE method : http://localhost:4000/api/workingtimes/:id

    #  a GET method : http://localhost:4000/api/clocks/:userID
    #  a POST method : http://localhost:4000/api/clocks/:userID
  end


  # Other scopes may use custom stacks.
  # scope "/api", BootstrapWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  # if Mix.env() in [:dev, :test] do
  #   import Phoenix.LiveDashboard.Router

  #   scope "/" do
  #     pipe_through :browser
  #     live_dashboard "/dashboard", metrics: Theme01Web.Telemetry
  #   end
  # end

  # Enables the Swoosh mailbox preview in development.
  #
  # Note that preview only shows emails that were sent by the same
  # node running the Phoenix server.
  # if Mix.env() == :dev do
  #   scope "/dev" do
  #     pipe_through :browser

  #     forward "/mailbox", Plug.Swoosh.MailboxPreview
  #   end
  # end
end
