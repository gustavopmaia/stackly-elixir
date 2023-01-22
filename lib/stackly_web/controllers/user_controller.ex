defmodule StacklyWeb.UserController do
  alias StacklyWeb.FallbackController
  use StacklyWeb, :controller

  alias StacklyWeb.Auth.Guardian

  action_fallback(FallbackController)

  def create(conn, params) do
    with {:ok, user} <- Stackly.create_user(params) do
      conn
      |> put_status(:created)
      |> render("user.json", %{user: user, message: "User created successfully"})
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, user} <- Stackly.fetch_user(id) do
      conn
      |> put_status(:ok)
      |> render("user.json", %{user: user, message: "User fetched successfully"})
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, _user} <- Stackly.delete_user(id) do
      conn
      |> put_status(:no_content)
      |> json(%{message: "User deleted successfully"})
    end
  end

  def update(conn, params) do
    with {:ok, user} <- Stackly.update_user(params) do
      conn
      |> put_status(:ok)
      |> render("user.json", %{user: user, message: "User updated successfully"})
    end
  end

  def sign_in(conn, params) do
    with {:ok, token} <- Guardian.authenticate(params) do
      conn
      |> put_status(:ok)
      |> render("sign_in.json", %{token: token})
    end
  end
end
