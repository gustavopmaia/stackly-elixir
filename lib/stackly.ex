defmodule Stackly do
  alias Stackly.{User, Post, Commentary}

  @moduledoc """
  Stackly keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  defdelegate create_user(params), to: User.Create, as: :call
  defdelegate fetch_user(params), to: User.Show, as: :call
  defdelegate delete_user(params), to: User.Delete, as: :call
  defdelegate update_user(params), to: User.Update, as: :call

  defdelegate create_post(params), to: Post.Create, as: :call
  defdelegate fetch_post(params), to: Post.Show, as: :call
  defdelegate fetch_all_posts(), to: Post.Show, as: :call_all
  defdelegate delete_post(params), to: Post.Delete, as: :call
  defdelegate update_post(params), to: Post.Update, as: :call

  defdelegate create_commentary(params), to: Commentary.Create, as: :call
  defdelegate fetch_commentary(params), to: Commentary.Show, as: :call
  defdelegate delete_commentary(params), to: Commentary.Delete, as: :call
  defdelegate update_commentary(params), to: Commentary.Update, as: :call
end
