import Config

port =
  "PORT"
  |> System.get_env("4000")
  |> String.to_integer()

config :imagemagick, port: port
