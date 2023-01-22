defmodule Stackly.Commentary.DeleteTest do
  use Stackly.DataCase

  alias Stackly.{Post, User, Commentary}
  alias Commentary.{Delete, Create}
  alias Post.Create, as: PostCreate
  alias User.Create, as: UserCreate

  describe "call/1" do
    test "when a valid ID is provided, deletes a commentary" do
      user_params = %{name: "Gustavo", email: "gustavo@teste.com", password: "123456"}
      {:ok, %User{id: user_id}} = UserCreate.call(user_params)
      post_params = %{title: "My post title", content: "Content of my post", user_id: user_id}
      {:ok, %Post{id: post_id}} = PostCreate.call(post_params)

      commentary_params = %{
        content: "Content of my commentary",
        user_id: user_id,
        post_id: post_id
      }

      {:ok, %Commentary{id: id}} = Create.call(commentary_params)

      response = Delete.call(%{"id" => id})

      assert {:ok, %Commentary{content: "Content of my commentary"}} = response
    end

    test "when a invalid ID is provided, returns a error" do
      response = Delete.call(%{"id" => "123456"})

      assert {:error, "Invalid ID format"} = response
    end

    test "when a valid ID is provided but commentary don't exist, returns a error" do
      response = Delete.call(%{"id" => Ecto.UUID.generate()})

      assert {:error, "Commentary not found"} = response
    end
  end
end
