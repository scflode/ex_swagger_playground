defmodule ExSwaggerPlaygroundWeb.FileController do
  use ExSwaggerPlaygroundWeb, :controller
  use PhoenixSwagger

  swagger_path :upload do
    post("/uploads")

    consumes "multipart/form-data"
    produces "application/json"

    parameter :contents, :formData, :file, "The file binary", required: true

    response(201, "Created")
  end

  def upload(conn, params) do
    IO.inspect(params)

    send_resp(conn, 201, "")
  end
end
