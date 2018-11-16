defmodule MiniPaint.Repo.Migrations.CreateRecipes do
  use Ecto.Migration

  def change do
    create table(:recipes, primary_key: false) do
      add(:id, :binary_id, primary_key: true)
      add(:character_name, :string, null: false)
      add(:game_id, references(:games, type: :uuid), null: false)
      add(:author_id, references(:users, on_delete: :nothing, type: :binary_id), null: false)

      timestamps()
    end

    create(index(:recipes, :game_id))
    create(index(:recipes, :author_id))
  end
end
