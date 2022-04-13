defmodule ExMon.Trainers.Create do
  alias ExMon.Repo
  alias ExMon.Trainers.Trainer

  def call(params) do
    params
    |> Trainer.build()
    |> handle_build()
  end

  defp handle_build({:ok, struct}), do: Repo.insert(struct)
  defp handle_build({:error, _changeset} = error), do: error
end
