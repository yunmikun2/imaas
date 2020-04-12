defmodule CaasClient.MixProject do
  use Mix.Project

  def project do
    [
      app: :caas_client,
      version: "0.1.0",
      deps: deps(),
      escript: escript()
    ]
  end

  def escript do
    [
      strip_beams: true,
      main_module: CaasClient
    ]
  end

  defp deps do
    [{:httpoison, "~> 1.6"}]
  end
end
