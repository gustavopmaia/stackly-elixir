defmodule Stackly.Commentary do
  use Ecto.Schema
  import Ecto.Changeset

  alias Stackly.{Post, User}

  @primary_key {:id, Ecto.UUID, autogenerate: true}
  @foreign_key_type Ecto.UUID
  @required_fields [:content, :user_id, :post_id]

  schema "comments" do
    field(:content, :string)
    belongs_to(:user, User)
    belongs_to(:post, Post)

    timestamps()
  end

  def build(params) do
    params
    |> changeset()
    |> apply_action(:insert)
  end

  def changeset(params), do: create_changeset(%__MODULE__{}, params)
  def changeset(commentary, params), do: create_changeset(commentary, params)

  def create_changeset(module_or_commentary, params) do
    module_or_commentary
    |> cast(params, @required_fields)
    |> validate_required(@required_fields)
    |> validate_length(:content, min: 3)
  end
end
