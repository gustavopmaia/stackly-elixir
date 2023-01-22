defmodule Stackly.Commentary.UpdateTest do
  use Stackly.DataCase

  alias Stackly.{Post, User, Commentary}
  alias Commentary.{Update, Create}
  alias Post.Create, as: PostCreate
  alias User.Create, as: UserCreate

  describe "call/1" do
    test "when valid parameters are provided, updates a commentary" do
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

      params = %{"id" => id, "content" => "My updated content"}

      response = Update.call(params)

      assert {:ok, %Commentary{content: "My updated content"}} = response
    end

    test "when invalid ID is provided, returns an error" do
      params = %{"id" => "123456"}

      response = Update.call(params)

      assert {:error, "Invalid ID format"} = response
    end

    test "when valid ID is provided but commentary don't exist, returns an error" do
      params = %{"id" => Ecto.UUID.generate()}

      response = Update.call(params)

      assert {:error, "Commentary not found"} = response
    end
  end
end
