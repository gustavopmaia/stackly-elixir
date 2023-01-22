defmodule Stackly.Post.CreateTest do
  use Stackly.DataCase

  alias Stackly.{Post, User}
  alias Post.Create, as: PostCreate
  alias User.Create, as: UserCreate

  describe "call/1" do
    test "when valid parameters are provided, creates a post" do
      user_params = %{name: "Gustavo", email: "gustavo@teste.com", password: "123456"}
      {:ok, %User{id: id}} = UserCreate.call(user_params)

      params = %{title: "My post title", content: "Content of my post", user_id: id}

      response = PostCreate.call(params)

      assert {:ok, %Post{title: "My post title", content: "Content of my post", user_id: id}} =
               response
    end

    test "when invalid user id is provided, returns an error" do
      params = %{title: "My post title", content: "Content of my post", user_id: "123456"}
      response = PostCreate.call(params)

      assert {:error,
              %Ecto.Changeset{
                valid?: false,
                errors: [user_id: {"is invalid", [type: Ecto.UUID, validation: :cast]}]
              }} = response
    end

    test "when invalid parameters are provided, returns an error" do
      user_params = %{name: "Gustavo", email: "gustavo@teste.com", password: "123456"}
      {:ok, %User{id: id}} = UserCreate.call(user_params)

      params = %{title: "My post title", user_id: id}

      response = PostCreate.call(params)

      assert {:error,
              %Ecto.Changeset{
                valid?: false,
                errors: [content: {"can't be blank", [validation: :required]}]
              }} = response
    end
  end
end
