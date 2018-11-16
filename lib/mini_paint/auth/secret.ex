defmodule MiniPaint.Auth.Secret do
  def secret_key do
    System.get_env("AUTH_SECRET_KEY")
  end
end
