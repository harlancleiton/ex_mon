defmodule ExMonWeb.TrainersController do
  use ExMonWeb, :controller

  alias ExMon.Trainers.{Create, DeleteById}

  action_fallback ExMonWeb.FallbackController

  def create(conn, params) do
    with {:ok, trainer} <- Create.call(params) do
      put_status(conn, :created)
      |> render(:created, trainer: trainer)
    else
      {:error, _error} = error -> error
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, _trainer} <- DeleteById.call(id) do
      put_status(conn, :no_content)
      |> text("")
    else
      {:error, _error} = error -> error
    end
  end
end
