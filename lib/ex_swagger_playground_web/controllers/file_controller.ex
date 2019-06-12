defmodule ExSwaggerPlaygroundWeb.FileController do
  use ExSwaggerPlaygroundWeb, :controller
  use PhoenixSwagger

  swagger_path :upload do
    post("/uploads")

    consumes "multipart/form-data"
    produces "application/json"

    parameters do
      contents :formData, :file, "The file binary", required: true
    end

    response(201, "Created")
  end

  def upload(conn, params) do
    IO.inspect(params)

    send_resp(conn, 201, "")
  end
end
