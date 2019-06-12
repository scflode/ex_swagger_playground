defmodule ExSwaggerPlaygroundWeb.Router do
  use ExSwaggerPlaygroundWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ExSwaggerPlaygroundWeb do
    pipe_through :api
  end
end
