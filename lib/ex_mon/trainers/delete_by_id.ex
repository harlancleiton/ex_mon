defmodule ExMon.Trainers.DeleteById do
  alias Ecto.UUID
  alias ExMon.Repo
  alias ExMon.Trainers.Trainer

  @spec call(String.t()) :: {:ok, %Trainer{}} | {:error, String.t()}
  def call(id) do
    with {:ok, uuid} <- UUID.cast(id) do
      do_delete(uuid)
    else
      :error -> {:error, "Invalid UUID"}
    end
  end

  defp do_delete(uuid) do
    with trainer when is_struct(trainer) <- Repo.get(Trainer, uuid) do
      Repo.delete(trainer)
      |> handle_delete()
    else
      nil -> {:error, "Trainer not found"}
    end
  end

  defp handle_delete({:ok, trainer}), do: {:ok, trainer}
  defp handle_delete({:error, changeset}), do: {:error, changeset}
end
