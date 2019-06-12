defmodule ExSwaggerPlayground.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      ExSwaggerPlaygroundWeb.Endpoint
    ]

    swagger_config = Application.get_env(:ex_swagger_playground, :phoenix_swagger)
    [schema | _] = Map.keys(swagger_config[:swagger_files])

    PhoenixSwagger.Validator.parse_swagger_schema(schema)

    opts = [strategy: :one_for_one, name: ExSwaggerPlayground.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    ExSwaggerPlaygroundWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
