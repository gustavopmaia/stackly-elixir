defmodule Stackly.Commentary.ShowTest do
  use Stackly.DataCase

  alias Stackly.{Post, User, Commentary}
  alias Commentary.{Show, Create}
  alias Post.Create, as: PostCreate
  alias User.Create, as: UserCreate

  describe "call/1" do
    test "when valid ID is provided, returns a commentary" do
      user_params = %{name: "Gustavo", email: "gustavo@teste.com", password: "123456"}
      {:ok, %User{id: user_id}} = UserCreate.call(user_params)
      post_params = %{title: "My post title", content: "Content of my post", user_id: user_id}
      {:ok, %Post{id: post_id}} = PostCreate.call(post_params)
      params = %{content: "Content of my commentary", user_id: user_id, post_id: post_id}
      {:ok, %Commentary{id: id}} = Create.call(params)

      response = Show.call(id)

      assert {:ok,
              %Commentary{content: "Content of my commentary", user_id: user_id, post_id: post_id}} =
               response
    end

    test "when invalid ID is provided, returns an error" do
      response = Show.call("123456")

      assert {:error, "Invalid ID format"} == response
    end

    test "when valid ID is provided but commentary don't exist, returns an error" do
      response = Show.call(Ecto.UUID.generate())

      assert {:error, "Commentary not found"} == response
    end
  end
end
