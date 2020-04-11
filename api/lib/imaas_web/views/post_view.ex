defmodule ImaasWeb.PostView do
  use ImaasWeb, :view

  alias Imaas.Images.Image

  def render("index.json", %{posts: posts}) do
    render_many(posts, __MODULE__, "post.json")
  end

  def render("created.json", %{post: post}) do
    render_one(post, __MODULE__, "post.json")
  end

  def render("post.json", %{post: post}) do
    %{
      image: url(post),
      created_at: DateTime.from_naive!(post.inserted_at, "Etc/UTC")
    }
  end

  defp url(%{image: image} = post) do
    "#{Application.get_env(:imaas, :application_host)}#{image_path({image, post})}"
  end

  defp image_path(image_and_post) do
    image_and_post
    |> Image.url()
    |> String.replace(Application.app_dir(:imaas), "")
  end
end
