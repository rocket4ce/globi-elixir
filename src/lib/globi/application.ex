defmodule Globi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Globi.Repo,
      # Start the Telemetry supervisor
      GlobiWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Globi.PubSub},
      # Start the Endpoint (http/https)
      GlobiWeb.Endpoint
      # Start a worker by calling: Globi.Worker.start_link(arg)
      # {Globi.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Globi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    GlobiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
