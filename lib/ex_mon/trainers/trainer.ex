defmodule ExMon.Trainers.Trainer do
  use ExMon.Schema

  import Ecto.Changeset

  schema "trainers" do
    field :name, :string
    field :email, :string
    field :password, :string

    timestamps()
  end

  @min_password_length 8
  @required_params [:name, :email, :password]
  @unique_indexes [:name, :email, :password]

  def build(params) do
    params
    |> changeset()
    |> apply_action(:build)
  end

  def changeset(params), do: do_changeset(%__MODULE__{}, params)
  def changeset(trainer, params), do: do_changeset(trainer, params)

  defp do_changeset(trainer, params) do
    trainer
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:password, min: @min_password_length)
    |> unique_constraint(@unique_indexes)
    |> put_pass_hash()
  end

  defp put_pass_hash(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    hash_password = Argon2.hash_pwd_salt(password)
    change(changeset, %{password: hash_password})
  end

  defp put_pass_hash(changeset), do: changeset
end
