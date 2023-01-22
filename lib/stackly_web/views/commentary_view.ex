defmodule StacklyWeb.CommentaryView do
  def render("commentary.json", %{
        message: message,
        commentary: %{content: content, post_id: post_id, user_id: user_id, id: id}
      }) do
    %{
      message: message,
      commentary: %{content: content, post_id: post_id, user_id: user_id, id: id}
    }
  end
end
