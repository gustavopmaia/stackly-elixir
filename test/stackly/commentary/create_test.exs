defmodule Stackly.Commentary.CreateTest do
  use Stackly.DataCase

  alias Stackly.{Post, User, Commentary}
  alias Commentary.Create
  alias Post.Create, as: PostCreate
  alias User.Create, as: UserCreate

  describe "call/1" do
    test "when valid parameters are provided, creates a commentary" do
      user_params = %{name: "Gustavo", email: "gustavo@teste.com", password: "123456"}
      {:ok, %User{id: user_id}} = UserCreate.call(user_params)
      post_params = %{title: "My post title", content: "Content of my post", user_id: user_id}
      {:ok, %Post{id: post_id}} = PostCreate.call(post_params)
      params = %{content: "Content of my commentary", user_id: user_id, post_id: post_id}

      response = Create.call(params)

      assert {:ok,
              %Commentary{content: "Content of my commentary", post_id: post_id, user_id: user_id}} =
               response
    end

    test "when invalid user ID is provided, returns an error" do
      user_params = %{name: "Gustavo", email: "gustavo@teste.com", password: "123456"}
      {:ok, %User{id: user_id}} = UserCreate.call(user_params)
      post_params = %{title: "My post title", content: "Content of my post", user_id: user_id}
      {:ok, %Post{id: post_id}} = PostCreate.call(post_params)
      params = %{content: "Content of my commentary", user_id: "123456", post_id: post_id}

      response = Create.call(params)

      assert {:error,
              %Ecto.Changeset{
                valid?: false,
                errors: [user_id: {"is invalid", [type: Ecto.UUID, validation: :cast]}]
              }} = response
    end

    test "when invalid post ID is provided, returns an error" do
      user_params = %{name: "Gustavo", email: "gustavo@teste.com", password: "123456"}
      {:ok, %User{id: user_id}} = UserCreate.call(user_params)
      post_params = %{title: "My post title", content: "Content of my post", user_id: user_id}
      {:ok, %Post{id: post_id}} = PostCreate.call(post_params)
      params = %{content: "Content of my commentary", user_id: user_id, post_id: "123456"}

      response = Create.call(params)

      assert {:error,
              %Ecto.Changeset{
                valid?: false,
                errors: [post_id: {"is invalid", [type: Ecto.UUID, validation: :cast]}]
              }} = response
    end
  end
end
