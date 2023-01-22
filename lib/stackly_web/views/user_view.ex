defmodule StacklyWeb.UserView do
  use StacklyWeb, :view

  def render("user.json", %{
        user: %{
          name: name,
          email: email,
          id: id,
          inserted_at: inserted_at,
          updated_at: updated_at
        },
        message: message
      }) do
    %{
      message: message,
      user: %{
        name: name,
        email: email,
        id: id,
        inserted_at: inserted_at,
        updated_at: updated_at
      }
    }
  end

  def render("delete.json", message: message) do
    %{message: message}
  end

  def render("sign_in.json", %{token: token}) do
    %{message: "Logged in successfully", token: token}
  end
end
