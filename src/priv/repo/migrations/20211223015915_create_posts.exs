defmodule Globi.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :title, :string
      add :slug, :string
      add :body, :text
      add :user_id, references(:users)
      add :published_at, :utc_datetime

      timestamps()
    end
  end
end
