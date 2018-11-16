defmodule MiniPaint.Recipes.Game do
  use Ecto.Schema
  import Ecto.Changeset

  alias MiniPaint.Recipes.Recipe

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @fields [
    :name
  ]

  schema "games" do
    field(:name)
    has_many(:recipes, Recipe)

    timestamps()
  end

  @doc false
  def changeset(game, attrs) do
    game
    |> cast(attrs, @fields)
    |> validate_required(@fields)
  end
end
