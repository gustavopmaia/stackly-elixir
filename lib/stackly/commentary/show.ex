defmodule Stackly.Commentary.Show do
  alias Stackly.{Repo, Commentary}
  alias Ecto.UUID

  def call(uuid) do
    case UUID.cast(uuid) do
      :error -> {:error, "Invalid ID format"}
      {:ok, uuid} -> get(uuid)
    end
  end

  defp get(uuid) do
    case Repo.get(Commentary, uuid) do
      nil -> {:error, "Commentary not found"}
      commentary -> {:ok, commentary}
    end
  end
end
