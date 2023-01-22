defmodule Stackly.Post.Create do
  alias Stackly.{Repo, Post}

  def call(params) do
    params
    |> Post.build()
    |> create_post()
  end

  defp create_post({:ok, post}), do: Repo.insert(post)
  defp create_post({:error, _reason} = error), do: error
end
