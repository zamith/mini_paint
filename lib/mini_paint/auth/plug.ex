defmodule MiniPaint.Auth.Plug do
  use Guardian.Plug.Pipeline, otp_app: :mini_paint

  plug(Guardian.Plug.VerifySession, claims: %{"typ" => "access"})
  plug(Guardian.Plug.VerifyHeader, claims: %{"typ" => "access"})
  plug(Guardian.Plug.LoadResource, allow_blank: true)
end
