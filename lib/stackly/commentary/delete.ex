defmodule Stackly.Commentary.Delete do
  alias Stackly.{Repo, Commentary}
  alias Ecto.UUID

  def call(%{"id" => uuid}) do
    case UUID.cast(uuid) do
      :error -> {:error, "Invalid ID format"}
      {:ok, uuid} -> delete(uuid)
    end
  end

  defp delete(uuid) do
    case fetch_commentary(uuid) do
      nil -> {:error, "Commentary not found"}
      commentary -> Repo.delete(commentary)
    end
  end

  defp fetch_commentary(uuid), do: Repo.get(Commentary, uuid)
end
