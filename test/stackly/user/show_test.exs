defmodule Stackly.User.ShowTest do
  use Stackly.DataCase

  alias Stackly.{User}
  alias Stackly.User.{Show, Create}

  describe "call/1" do
    test "when valid id is provided, returns an user" do
      params = %{name: "Gustavo", email: "gustavo@teste.com", password: "123456"}
      {:ok, %User{id: id}} = Create.call(params)

      response = Show.call(id)

      assert {:ok, %User{name: "Gustavo", email: "gustavo@teste.com"}} = response
    end

    test "when a invalid id is provided, returns an error" do
      response = Show.call("123456")

      assert {:error, "Invalid ID format"} == response
    end

    test "when a valid id is provided but the user don't exist, returns an error" do
      response = Show.call(Ecto.UUID.generate())

      assert {:error, "User not found"} == response
    end
  end
end
