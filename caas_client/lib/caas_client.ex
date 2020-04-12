defmodule CaasClient do
  @moduledoc false

  alias HTTPoison.Request

  def main([input | args]) do
    [output | options_reversed] = Enum.reverse(args)
    options = Enum.reverse(options_reversed)

    case HTTPoison.request(request(input, options)) do
      {:ok, %{status_code: 200, body: image}} ->
        File.write!(output, image)

      {:ok, %{status_code: 400, headers: headers, body: stdout}} ->
        IO.puts(stdout)
        System.halt(find_exit_code(headers) || 1)
    end
  end

  def request(input, options) do
    %Request{
      method: :post,
      url: url(),
      body: body(input, options)
    }
  end

  defp body(input, options) do
    {
      :multipart,
      [
        {"options", Enum.join(options, " ")},
        {:file, input, "image", []}
      ]
    }
  end

  defp url do
    System.get_env("CONVERTER_URL") ||
      raise "environment variable CONVERTER_URL is missing"
  end

  defp find_exit_code(headers) do
    case Enum.find(headers, fn {k, _} -> k == "x-exit-code" end) do
      {"x-exit-code", code} -> code
      nil -> nil
    end
  end
end
