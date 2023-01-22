defmodule Stackly.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias Stackly.Post

  @primary_key {:id, Ecto.UUID, autogenerate: true}
  @foreign_key_type Ecto.UUID
  @required_fields [:name, :email, :password]

  @derive {Jason.Encoder, only: [:name, :email, :post]}

  schema "users" do
    field(:name, :string)
    field(:email, :string)
    field(:password, :string, virtual: true)
    field(:password_hash, :string)
    has_many(:post, Post)

    timestamps()
  end

  def build(params) do
    params
    |> changeset()
    |> apply_action(:insert)
  end

  def changeset(params), do: create_changeset(%__MODULE__{}, params)
  def changeset(user, params), do: create_changeset(user, params)

  def create_changeset(module_or_user, params) do
    module_or_user
    |> cast(params, @required_fields)
    |> validate_required(@required_fields)
    |> validate_length(:name, min: 2)
    |> validate_length(:password, min: 6)
    |> validate_format(:email, ~r/@/)
    |> put_password_hash()
    |> unique_constraint(:email, message: "Email must be unique")
  end

  defp put_password_hash(
         %Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset
       ) do
    change(changeset, Argon2.add_hash(password))
  end

  defp put_password_hash(changeset), do: changeset
end
