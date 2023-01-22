defmodule Stackly.User.Update do
  alias Ecto.UUID
  alias Stackly.{User, Repo}

  def call(%{"id" => uuid} = params) do
    case UUID.cast(uuid) do
      :error -> {:error, "Invalid ID format"}
      {:ok, _} -> update(params)
    end
  end

  defp update(%{"id" => uuid} = params) do
    case fetch_user(uuid) do
      nil -> {:error, "User not found"}
      user -> update_user(user, params)
    end
  end

  defp fetch_user(uuid), do: Repo.get(User, uuid)

  defp update_user(user, params) do
    user
    |> User.changeset(params)
    |> Repo.update()
  end
end
