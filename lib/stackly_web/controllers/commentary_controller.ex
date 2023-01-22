defmodule StacklyWeb.CommentaryController do
  use StacklyWeb, :controller

  action_fallback(StacklyWeb.FallbackController)

  def create(conn, params) do
    with {:ok, commentary} <- Stackly.create_commentary(params) do
      conn
      |> put_status(:created)
      |> render("commentary.json", %{
        commentary: commentary,
        message: "Commentary created successfully"
      })
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, commentary} <- Stackly.fetch_commentary(id) do
      conn
      |> put_status(:ok)
      |> render("commentary.json", %{
        message: "Commentary fetched successfully",
        commentary: commentary
      })
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, _commentary} <- Stackly.delete_commentary(id) do
      conn
      |> put_status(:no_content)
      |> json(%{message: "Commentary deleted successfully"})
    end
  end

  def update(conn, params) do
    with {:ok, commentary} <- Stackly.update_commentary(params) do
      conn
      |> put_status(:ok)
      |> render("commentary.json", %{
        commentary: commentary,
        message: "Commentary updated successfully"
      })
    end
  end
end
