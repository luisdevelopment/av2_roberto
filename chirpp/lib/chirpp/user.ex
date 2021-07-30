defmodule Chirpp.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :name, :string
    field :username, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    has_many :posts, Chirpp.Timeline.Post

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :username, :password, :password_hash])
    |> validate_required([:name, :username, :password])
    |> validate_length(:username, min: 3, max: 16)
    |> validate_length(:password, min: 3, max: 32)
    |> unique_constraint(:username)
    #|> put_hash()
  end

  def put_hash(changeset) do
    # case changeset do
    #   %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
    #     put_change(changeset, :password_hash, Bcrypt.hash_pwd_salt(pass))
    #   _ -> changeset
    # end
  end
end
