defmodule Imaas.Images.Image do
  @moduledoc false

  use Arc.Definition
  use Arc.Ecto.Definition

  @versions [:original, :thumb]

  def filename(version, {file, _scope}) do
    "#{file.file_name}_#{version}"
  end

  def transform(:thumb, _) do
    {:convert, "-strip -thumbnail 100x100^ -gravity center -extent 100x100"}
  end
end
