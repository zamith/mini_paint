defmodule MiniPaintWeb.SessionController do
  use MiniPaintWeb, :controller

  alias MiniPaint.Auth.Guardian
  alias MiniPaint.Accounts

  def create(conn, params) do
    case Accounts.validate_credentials(params) do
      {:ok, user} ->
        conn
        |> Guardian.Plug.sign_in(user, %{"typ" => "access"})
        |> put_flash(:info, "Welcome to MiniPaint!")
        |> redirect(to: "/")

      {:error, _reason} ->
        conn
        |> put_flash(:error, "Invalid credentials")
        |> redirect(to: "/")
    end
  end
end
