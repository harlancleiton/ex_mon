defmodule ExMon.Trainers.GetById do
  alias Ecto.UUID
  alias ExMon.Repo
  alias ExMon.Trainers.Trainer

  @spec call(String.t()) :: {:ok, %Trainer{}} | {:error, String.t()}
  def call(id) do
    with {:ok, uuid} <- UUID.cast(id) do
      do_get(uuid)
    else
      :error -> {:error, "Invalid UUID"}
    end
  end

  defp do_get(uuid) do
    with trainer when is_struct(trainer) <- Repo.get(Trainer, uuid) do
      {:ok, trainer}
    else
      nil -> {:error, "Trainer not found"}
    end
  end
end
