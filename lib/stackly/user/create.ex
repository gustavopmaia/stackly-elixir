defmodule Stackly.User.Create do
  alias Stackly.{User, Repo}

  def call(params) do
    params
    |> User.build()
    |> create_user()
  end

  defp create_user({:ok, user}), do: Repo.insert(user)
  defp create_user({:error, _changeset} = error), do: error
end
