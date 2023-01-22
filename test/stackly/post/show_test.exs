defmodule Stackly.Post.ShowTest do
  use Stackly.DataCase

  alias Stackly.{Post, User}

  alias Post.Show
  alias Post.Create, as: PostCreate
  alias User.Create, as: UserCreate

  describe "call/1" do
    test "when valid ID is provided, returns a post" do
      user_params = %{name: "Gustavo", email: "gustavo@teste.com", password: "123456"}
      {:ok, %User{id: user_id}} = UserCreate.call(user_params)
      params = %{title: "My post title", content: "Content of my post", user_id: user_id}
      {:ok, %Post{id: id}} = PostCreate.call(params)

      response = Show.call(id)

      assert {:ok, %Post{title: "My post title", content: "Content of my post", user_id: user_id}} =
               response
    end

    test "when invalid ID is provided, returns an error" do
      response = Show.call("123456")

      assert {:error, "Invalid ID format"} = response
    end

    test "when valid ID is provided but post don't exist, returns an error" do
      response = Show.call(Ecto.UUID.generate())

      assert {:error, "Post not found"} = response
    end
  end
end
