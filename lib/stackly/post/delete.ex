defmodule Stackly.Post.Delete do
  alias Stackly.{Repo, Post}
  alias Ecto.UUID

  def call(%{"id" => uuid}) do
    case UUID.cast(uuid) do
      :error -> {:error, "Invalid ID format"}
      {:ok, uuid} -> delete(uuid)
    end
  end

  defp delete(uuid) do
    case fetch_post(uuid) do
      nil -> {:error, "Post not found"}
      post -> Repo.delete(post)
    end
  end

  defp fetch_post(uuid), do: Repo.get(Post, uuid)
end
