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

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:password, min: @min_password_length)
    |> unique_constraint(@unique_indexes)
  end
end
