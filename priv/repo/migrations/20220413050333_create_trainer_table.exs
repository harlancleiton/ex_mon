defmodule ExMon.Repo.Migrations.CreateTrainerTable do
  use Ecto.Migration

  def change do
    # create table(:trainers, primary_key: false) do
    create table(:trainers) do
      add :name, :string, null: false, size: 60
      add :email, :string, null: false, size: 80
      add :password, :string, null: false

      timestamps()
    end

    create unique_index(:trainers, :email)
    create unique_index(:trainers, :password)
  end

  def down do
    drop unique_index(:trainers, :email)
    drop unique_index(:trainers, :password)

    drop table(:trainers)
  end
end
