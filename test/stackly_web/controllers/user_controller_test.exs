defmodule StacklyWeb.UserControllerTest do
  use StacklyWeb.ConnCase
  import StacklyWeb.Auth.Guardian

  alias Stackly.User

  describe "show/2" do
    setup %{conn: conn} do
      params = %{name: "Gustavo", email: "gustavo@teste.com", password: "123456"}
      {:ok, user} = Stackly.create_user(params)
      {:ok, token, _claims} = encode_and_sign(user)

      conn = put_req_header(conn, "authorization", "Bearer #{token}")
      {:ok, conn: conn}
    end

    test "when there is a user with the given id, returns the user", %{conn: conn} do
      params = %{name: "Gustavo", email: "gustavo@teste.com", password: "123456"}

      {:ok, %User{id: id}} = Stackly.create_user(params)

      response =
        conn
        |> get(Routes.user_path(conn, :show, id))
        |> json_response(:ok)

      assert = %{"user" => %{"name" => "Gustavo"}} = response
    end

    test "when there is an error, returns the error", %{conn: conn} do
      response =
        conn
        |> get(Routes.user_path(conn, :show, "1234"))
        |> json_response(:bad_request)

      expected_response = %{"message" => "Invalid ID format!"}

      assert response = expected_response
    end
  end

  describe "create/2" do
    setup %{conn: conn} do
      params = %{name: "Gustavo", email: "gustavo@teste.com", password: "123456"}
      {:ok, user} = Stackly.create_user(params)
      {:ok, token, _claims} = encode_and_sign(user)

      conn = put_req_header(conn, "authorization", "Bearer #{token}")
      {:ok, conn: conn}
    end

    test "when valid params are provided, create a user", %{conn: conn} do
      params = %{name: "Gustavo", email: "gustavo1@teste.com", password: "123456"}

      response =
        conn
        |> post(Routes.user_path(conn, :create, params))
        |> json_response(:created)

      expected_response = %{"message" => "User created successfully"}

      assert response = expected_response
    end

    test "when there is a error, returns the error", %{conn: conn} do
      params = %{name: "Gustavo", email: "gustavo1@teste.com"}

      response =
        conn
        |> post(Routes.user_path(conn, :create, params))
        |> json_response(:bad_request)

      expected_response = %{"message" => %{"password" => "can't be blank"}}

      assert response = expected_response
    end
  end
end
