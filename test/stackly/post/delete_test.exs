defmodule Stackly.Post.DeleteTest do
  use Stackly.DataCase

  alias Stackly.{Post, User}
  alias Post.Delete
  alias Post.Create, as: PostCreate
  alias User.Create, as: UserCreate

  describe "call/1" do
    test "when a valid ID is provided, deletes the post" do
      user_params = %{name: "Gustavo", email: "gustavo@teste.com", password: "123456"}
      {:ok, %User{id: user_id}} = UserCreate.call(user_params)
      params = %{title: "My post title", content: "Content of my post", user_id: user_id}
      {:ok, %Post{id: id}} = PostCreate.call(params)

      response = Delete.call(%{"id" => id})

      assert {:ok, %Post{id: id, title: "My post title"}} = response
    end

    test "when a invalid ID is provided, returns an error" do
      response = Delete.call(%{"id" => "123456"})

      assert {:error, "Invalid ID format"} == response
    end

    test "when a valid ID is provided but the post don't exist, returns an error" do
      response = Delete.call(%{"id" => Ecto.UUID.generate()})

      assert {:error, "Post not found"} == response
    end
  end
end
