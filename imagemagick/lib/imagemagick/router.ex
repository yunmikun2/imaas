defmodule Imagemagick.Router do
  @moduledoc false

  use Plug.Builder

  plug Plug.Logger

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart],
    pass: ["application/x-www-form-urlencoded"]

  plug Imagemagick.ValidateMethodPlug
  plug Imagemagick.EnsureUploadPlug
  plug Imagemagick.FetchOptionsPlug
  plug Imagemagick.AcceptPlug
  plug Imagemagick.ConverterPlug
end
