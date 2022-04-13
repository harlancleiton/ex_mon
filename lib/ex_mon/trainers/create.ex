defmodule ExMon.Trainers.Create do
  alias ExMon.Repo
  alias ExMon.Trainers.Trainer

  def call(params) do
    params
    |> Trainer.build()
    |> do_create()
  end

  defp do_create({:ok, struct}), do: Repo.insert(struct)
  defp do_create({:error, _changeset} = error), do: error
end
