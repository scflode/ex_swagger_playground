defmodule ExSwaggerPlaygroundWeb.Router do
  use ExSwaggerPlaygroundWeb, :router

  pipeline :api do
    plug :accepts, ["json", "text"]
    plug PhoenixSwagger.Plug.Validate
  end

  scope "/", ExSwaggerPlaygroundWeb do
    pipe_through :api

    post "/uploads", FileController, :upload
  end

  scope "/api/swagger" do
    forward("/", PhoenixSwagger.Plug.SwaggerUI,
      otp_app: :ex_swagger_playground,
      swagger_file: "swagger.json"
    )
  end

  def swagger_info do
    %{
      info: %{
        version: "0.1.0",
        title: "Upload API"
      }
    }
  end
end
