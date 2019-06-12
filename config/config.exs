# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :ex_swagger_playground, ExSwaggerPlaygroundWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "PAWmo7uMlpVwOKZe4MtYT70cArpnn+weZJw6ucyDFM2wZ7EGMI9etMElDruZWlBN",
  render_errors: [view: ExSwaggerPlaygroundWeb.ErrorView, accepts: ~w(json)]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :ex_swagger_playground, :phoenix_swagger,
  swagger_files: %{
    "priv/static/swagger.json" => [
      # phoenix routes will be converted to swagger paths
      router: ExSwaggerPlaygroundWeb.Router,
      # (optional) endpoint config used to set host, port and https schemes.
      endpoint: ExSwaggerPlaygroundWeb.Endpoint
    ]
  }

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
