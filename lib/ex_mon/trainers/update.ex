defmodule ExMon.Trainers.Update do
  alias Ecto.UUID
  alias ExMon.Repo
  alias ExMon.Trainers.Trainer

  @spec call(map()) :: {:ok, %Trainer{}} | {:error, String.t()}
  def call(%{"id" => id} = params) do
    with {:ok, uuid} <- UUID.cast(id) do
      do_update(uuid, params)
    else
      :error -> {:error, "Invalid UUID"}
    end
  end

  defp do_update(uuid, params) do
    with trainer when is_struct(trainer) <- Repo.get(Trainer, uuid) do
      Trainer.changeset(trainer, params)
      |> Repo.update()
      |> handle_update()
    else
      nil -> {:error, "Trainer not found"}
    end
  end

  defp handle_update({:ok, trainer}), do: {:ok, trainer}
  defp handle_update({:error, changeset}), do: {:error, changeset}
end
