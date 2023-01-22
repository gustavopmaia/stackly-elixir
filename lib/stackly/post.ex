defmodule Stackly.Post do
  use Ecto.Schema
  import Ecto.Changeset

  alias Stackly.User

  @primary_key {:id, Ecto.UUID, autogenerate: true}
  @foreign_key_type Ecto.UUID
  @required_fields [:title, :content, :user_id]

  @derive {Jason.Encoder, only: [:title, :content, :likes, :user_id]}

  schema "posts" do
    field(:title, :string)
    field(:content, :string)
    field(:likes, :integer, default: 0)
    belongs_to(:user, User)

    timestamps()
  end

  def build(params) do
    params
    |> changeset()
    |> apply_action(:insert)
  end

  def changeset(params), do: create_changeset(%__MODULE__{}, params)
  def changeset(post, params), do: create_changeset(post, params)

  def create_changeset(module_or_post, params) do
    module_or_post
    |> cast(params, @required_fields)
    |> validate_required(@required_fields)
    |> validate_length(:title, min: 5)
    |> validate_length(:content, min: 15)
  end
end
