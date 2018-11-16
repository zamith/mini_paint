defmodule MiniPaintWeb.RecipeController do
  use MiniPaintWeb, :controller

  def show(conn, %{"id" => id}) do
    recipe = MiniPaint.Recipes.get_recipe!(id)

    render(conn, "show.html", recipe: recipe)
  end
end
