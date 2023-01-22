defmodule Stackly.Post.Update do
  alias Ecto.UUID
  alias Stackly.{Repo, Post}

  def call(%{"id" => uuid} = params) do
    case UUID.cast(uuid) do
      :error -> {:error, "Invalid ID format"}
      {:ok, _} -> update(params)
    end
  end

  defp update(%{"id" => uuid} = params) do
    case fetch_post(uuid) do
      nil -> {:error, "Post not found"}
      post -> update_post(post, params)
    end
  end

  defp update_post(post, params) do
    post
    |> Post.changeset(params)
    |> Repo.update()
  end

  defp fetch_post(uuid), do: Repo.get(Post, uuid)
end
