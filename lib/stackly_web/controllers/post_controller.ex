defmodule StacklyWeb.PostController do
  use StacklyWeb, :controller

  action_fallback(StacklyWeb.FallbackController)

  def create(conn, params) do
    with {:ok, post} <- Stackly.create_post(params) do
      conn
      |> put_status(:created)
      |> render("post.json", %{post: post, message: "Post created successfully"})
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, post} <- Stackly.fetch_post(id) do
      conn
      |> put_status(:ok)
      |> render("post.json", %{message: "Post fetched successfully", post: post})
    end
  end

  def show_all(conn, _params) do
    with {:ok, posts} <- Stackly.fetch_all_posts() do
      conn
      |> put_status(:ok)
      |> render("posts.json", %{posts: posts})
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, _post} <- Stackly.delete_post(id) do
      conn
      |> put_status(:no_content)
      |> json(%{message: "Post deleted successfully"})
    end
  end

  def update(conn, params) do
    with {:ok, post} <- Stackly.update_post(params) do
      conn
      |> put_status(:ok)
      |> render("post.json", %{post: post, message: "Post updated successfully"})
    end
  end
end
