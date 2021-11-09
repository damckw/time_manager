defmodule Theme01Web.Router do
  use Theme01Web, :router
  use Pow.Phoenix.Router


  pipeline :api do
    plug :accepts, ["json"]
    plug Theme01.Auth.AuthFlow, otp_app: :theme01
  end

  pipeline :api_protected do
    plug Pow.Plug.RequireAuthenticated,
      error_handler: Theme01Web.AuthErrorHandler
  end
  

  scope "/api", Theme01Web do
    pipe_through [:api, :api_protected]

    get "/users", UserController, :getUserID
    get "/users/:userID", UserController, :getUserByID
    post "/users", UserController, :createUser
    put "/users/:userID", UserController, :updateUser
    delete "/users/:userID", UserController, :deleteUser

    get "/workingtimes/", WorkingTimeController, :index
    get "/workingtimes/:userID", WorkingTimeController, :getWorkingTime
    get "/workingtimes/:id", WorkingTimeController, :getWorkingTime
    post "/workingtimes/:userID", WorkingTimeController, :createWorkingTimeByUserID
    put "/workingtimes/:id", WorkingTimeController, :updateWorkingTimeByID
    delete "/workingtimes/:id", WorkingTimeController, :deleteWorkingTimeByID

    get "/clocks/:userID", ClockController, :getClocksByUserID
    post "/clocks/:userID", ClockController, :setClockByUserID
  
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

  scope "/api/auth", Theme01Web.Controllers do
    pipe_through :api

    post "/login", UserLogin, :login
  end

  scope "/api/auth", Theme01Web.Controllers do
    pipe_through [:api, :api_protected]

    post "/register", UserRegistration, :register
  end

end
