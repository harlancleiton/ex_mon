defmodule ExMonWeb.TrainersController do
  use ExMonWeb, :controller

  alias ExMon.Trainers.Create

  action_fallback ExMonWeb.FallbackController

  def create(conn, params) do
    with {:ok, trainer} <- Create.call(params) do
      put_status(conn, :created)
      |> render(:created, trainer: trainer)
    else
      {:error, _error} = error -> error
    end
  end
end
