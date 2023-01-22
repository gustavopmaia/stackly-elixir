defmodule StacklyWeb.PostView do
  def render("post.json", %{
        post: %{id: id, content: content, user_id: user_id, user: %{name: name, email: email}},
        message: message
      }) do
    %{
      message: message,
      post: %{id: id, content: content, user_id: user_id, user: %{name: name, email: email}}
    }
  end

  def render("posts.json", %{posts: posts}) do
    posts
  end
end
