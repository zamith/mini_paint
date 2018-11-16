defmodule MiniPaintWeb.AuthCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      import MiniPaint.Auth.Guardian, only: [encode_and_sign: 3]

      def authenticated_request(conn, %{email: _email} = user) do
        {:ok, token, _} = encode_and_sign(user, %{}, token_type: :access)

        conn
        |> put_req_header("authorization", "bearer: " <> token)
        |> put_req_header("content-type", "html")
      end
    end
  end
end
