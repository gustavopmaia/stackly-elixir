defmodule Stackly.Post.UpdateTest do
  use Stackly.DataCase

  alias Stackly.{Post, User}
  alias Post.Update
  alias Post.Create, as: PostCreate
  alias User.Create, as: UserCreate

  describe "call/1" do
    test "when valid ID and parameters are provided, returns updates the post" do
      user_params = %{name: "Gustavo", email: "gustavo@teste.com", password: "123456"}
      {:ok, %User{id: user_id}} = UserCreate.call(user_params)
      params = %{title: "My post title", content: "Content of my post", user_id: user_id}
      {:ok, %Post{id: id}} = PostCreate.call(params)

      update_params = %{
        "id" => id,
        "title" => "My updated post title",
        "content" => "Updated content of my post"
      }

      response = Update.call(update_params)

      assert {:ok, %Post{title: "My updated post title", content: "Updated content of my post"}} =
               response
    end

    test "when invalid ID is provided, returns an error" do
      response = Update.call(%{"id" => "123456"})

      assert {:error, "Invalid ID format"} = response
    end

    test "when a valid ID is provided but the post don't exist, returns an error" do
      response = Update.call(%{"id" => Ecto.UUID.generate()})

      assert {:error, "Post not found"} = response
    end
  end
end
