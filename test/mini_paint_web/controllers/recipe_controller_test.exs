defmodule MiniPaintWeb.RecipeControllerTest do
  use MiniPaintWeb.ConnCase
  use MiniPaint.DataCase

  test "show", %{conn: conn} do
    recipe = insert(:recipe)

    conn = get(conn, recipe_path(conn, :show, recipe.id))

    assert html_response(conn, 200) =~ recipe.character_name
  end

  test "index", %{conn: conn} do
    recipe = insert(:recipe)

    conn = get(conn, recipe_path(conn, :index))

    assert html_response(conn, 200) =~ recipe.character_name
  end
end
