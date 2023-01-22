defmodule Stackly.Repo.Migrations.CreateCommentsTable do
  use Ecto.Migration

  def change do
    create table(:comments, primary_key: false) do
      add(:id, :uuid, primary_key: true)
      add(:content, :string)
      add(:user_id, references(:users, type: :uuid, on_delete: :delete_all), null: false)
      add(:post_id, references(:posts, type: :uuid, on_delete: :delete_all), null: false)

      timestamps()
    end
  end
end
