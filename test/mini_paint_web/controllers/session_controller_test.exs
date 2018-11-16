defmodule MiniPaintWeb.SessionControllerTest do
  use MiniPaintWeb.ConnCase
  use MiniPaint.DataCase

  test "create", %{conn: conn} do
    user = insert(:user)

    credentials = %{
      email: user.email,
      password: "secret"
    }

    conn = post(conn, session_path(conn, :create), credentials)

    assert MiniPaint.Auth.Guardian.Plug.current_resource(conn) == user
  end
end
