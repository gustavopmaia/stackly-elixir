defmodule Stackly.User.Show do
  alias Ecto.UUID
  alias Stackly.{Repo, User}

  def call(uuid) do
    case UUID.cast(uuid) do
      :error -> {:error, "Invalid ID format"}
      {:ok, uuid} -> get(uuid)
    end
  end

  def get(uuid) do
    case Repo.get(User, uuid) do
      nil -> {:error, "User not found"}
      user -> {:ok, Repo.preload(user, :post)}
    end
  end

  def call_all() do
    users = Repo.all(User)
    {:ok, Repo.preload(users, :post)}
  end
end
