defmodule Stackly.Post.Show do
  alias Stackly.{Repo, Post}
  alias Ecto.UUID

  def call(uuid) do
    case UUID.cast(uuid) do
      :error -> {:error, "Invalid ID format"}
      {:ok, uuid} -> get(uuid)
    end
  end

  defp get(uuid) do
    case Repo.get(Post, uuid) do
      nil -> {:error, "Post not found"}
      post -> {:ok, Repo.preload(post, :user)}
    end
  end

  def call_all() do
    posts = Repo.all(Post)
    {:ok, Repo.preload(posts, :user)}
  end
end
