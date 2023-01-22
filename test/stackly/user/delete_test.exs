defmodule Stackly.User.DeleteTest do
  use Stackly.DataCase

  alias Stackly.{User, Repo}
  alias User.{Delete, Create}

  describe "call/1" do
    test "when a valid ID is provided, the user is deleted" do
      params = %{name: "Gustavo", email: "gustavo@teste.com", password: "123456"}
      {:ok, %User{id: id}} = Create.call(params)

      count_before = Repo.aggregate(User, :count)

      response = Delete.call(id)

      count_after = Repo.aggregate(User, :count)

      assert {:ok, %User{name: "Gustavo"}} = response
      assert count_before > count_after
    end

    test "when a invalid ID is provided, returns an error" do
      response = Delete.call("123456")

      assert {:error, "Invalid ID format"} == response
    end

    test "when a valid ID is provided but the user don't exist, returns an error" do
      response = Delete.call(Ecto.UUID.generate())

      assert {:error, "User not found"} == response
    end
  end
end
