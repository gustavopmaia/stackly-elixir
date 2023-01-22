defmodule Stackly.Commentary.Create do
  alias Stackly.{Commentary, Repo}

  def call(params) do
    params
    |> Commentary.build()
    |> create_commentary()
  end

  defp create_commentary({:ok, commentary}), do: Repo.insert(commentary)
  defp create_commentary({:error, _reason} = error), do: error
end
