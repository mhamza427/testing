defmodule Piano.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application
  
  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Piano.Repo,
      # Start the Telemetry supervisor
      PianoWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Piano.PubSub},
      # Start the Endpoint (http/https)
      PianoWeb.Endpoint,
      PianoWeb.Presence
      # Start a worker by calling: Piano.Worker.start_link(arg)
      # {Piano.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Piano.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PianoWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
