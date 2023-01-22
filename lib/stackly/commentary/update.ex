defmodule Stackly.Commentary.Update do
  alias Ecto.UUID
  alias Stackly.{Repo, Commentary}

  def call(%{"id" => uuid} = params) do
    case UUID.cast(uuid) do
      :error -> {:error, "Invalid ID format"}
      {:ok, _uuid} -> update(params)
    end
  end

  def update(%{"id" => uuid} = params) do
    case fetch_commentary(uuid) do
      nil -> {:error, "Commentary not found"}
      commentary -> update_commentary(commentary, params)
    end
  end

  defp fetch_commentary(uuid), do: Repo.get(Commentary, uuid)

  defp update_commentary(commentary, params) do
    commentary
    |> Commentary.changeset(params)
    |> Repo.update()
  end
end
