defmodule Stackly.User.UpdateTest do
  use Stackly.DataCase

  alias Stackly.User
  alias User.{Update, Create}

  describe "call/1" do
    test "when valid parameters and ID are provided, returns an updated user" do
      params = %{name: "Gustavo", password: "123456", email: "gustavo@teste.com"}

      {:ok, %User{id: id}} = Create.call(params)

      update_params = %{
        "id" => id,
        "name" => "Gustavo Updated",
        "email" => "gustavo_updated@teste.com",
        "password" => "123456"
      }

      response = Update.call(update_params)

      assert {:ok, %User{name: "Gustavo Updated", email: "gustavo_updated@teste.com"}} = response
    end

    test "when invalid ID is provided, returns an error" do
      response = Update.call(%{"id" => "123456"})

      assert {:error, "Invalid ID format"} == response
    end

    test "when valid ID is provided but user don't exist, returns an error" do
      response = Update.call(%{"id" => Ecto.UUID.generate()})

      assert {:error, "User not found"} = response
    end
  end
end
