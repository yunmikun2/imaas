defmodule Imagemagick.Application do
  @moduledoc false

  use Application

  alias Imagemagick.Router

  def start(_type, _args) do
    children = [
      Plug.Cowboy.child_spec(
        scheme: :http,
        plug: Router,
        port: Application.get_env(:imagemagick, :port)
      )
    ]

    opts = [strategy: :one_for_one, name: Imagemagick.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
