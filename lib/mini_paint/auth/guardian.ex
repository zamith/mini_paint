defmodule MiniPaint.Auth.Guardian do
  use Guardian, otp_app: :mini_paint

  # TODO: Change this to use real users

  def subject_for_token(resource, _claims) do
    {:ok, resource.email}
  end

  def resource_from_claims(claims) do
    {:ok, %{email: claims["sub"]}}
  end
end
