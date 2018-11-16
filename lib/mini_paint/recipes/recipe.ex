defmodule MiniPaint.Recipes.Recipe do
  use Ecto.Schema
  import Ecto.Changeset

  alias MiniPaint.Recipes.Game
  alias MiniPaint.Accounts.User

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @fields [
    :character_name,
    :game_id,
    :author_id
  ]

  schema "recipes" do
    field(:character_name)
    belongs_to(:game, Game)
    belongs_to(:author, User)

    timestamps()
  end

  @doc false
  def changeset(recipe, attrs) do
    recipe
    |> cast(attrs, @fields)
    |> validate_required(@fields)
    |> foreign_key_constraint(:game_id)
    |> foreign_key_constraint(:author_id)
  end
end
