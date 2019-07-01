defmodule MiniPaintWeb.RecipeController do
  use MiniPaintWeb, :controller

  def show(conn, %{"id" => id}) do
    recipe =
      MiniPaint.Recipes.get_recipe!(id)
      |> MiniPaint.Repo.preload([:game, :author])

    render(conn, "show.html", recipe: recipe)
  end

  def index(conn, _params) do
    recipes = MiniPaint.Recipes.list_recipes()

    render(conn, "index.html", recipes: recipes)
  end
end
