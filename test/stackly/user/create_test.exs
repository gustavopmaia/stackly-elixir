defmodule Stackly.Trainer.CreateTest do
  use Stackly.DataCase

  alias Stackly.{User, Repo}
  alias User.Create

  describe "call/1" do
    test "when all params are valid, create a user" do
      params = %{name: "Gustavo", email: "gustavo@teste.com", password: "123456"}

      count_before = Repo.aggregate(User, :count)

      response = Create.call(params)

      count_after = Repo.aggregate(User, :count)

      assert {:ok, %User{name: "Gustavo", email: "gustavo@teste.com"}} = response

      assert count_after > count_before
    end

    test "when there are invalid params, returns aan error" do
      params = %{name: "Gustavo", password: "123456"}

      response = Create.call(params)

      assert {:error,
              %Ecto.Changeset{
                valid?: false,
                errors: [email: {"can't be blank", [validation: :required]}]
              }} = response
    end
  end
end
