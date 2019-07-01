defmodule MiniPaint.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @fields [
    :email,
    :username,
    :password_hash
  ]

  schema "users" do
    field(:email)
    field(:password_hash)
    field(:username)

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, @fields)
    |> validate_required(@fields)
    |> unique_constraint(:email)
    |> unique_constraint(:username)
    |> put_password_hash()
  end

  defp put_password_hash(
         %Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset
       ) do
    change(changeset, Comeonin.Bcrypt.add_hash(password))
  end

  defp put_password_hash(changeset), do: changeset
end
