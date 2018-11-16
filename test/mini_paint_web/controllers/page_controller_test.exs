defmodule MiniPaintWeb.PageControllerTest do
  use MiniPaintWeb.ConnCase
  use MiniPaintWeb.AuthCase
  use MiniPaint.DataCase

  test "GET /", %{conn: conn} do
    user = build(:user)

    conn =
      conn
      |> authenticated_request(user)
      |> get("/")

    assert html_response(conn, 200) =~ "Welcome to Phoenix!"
  end
end
