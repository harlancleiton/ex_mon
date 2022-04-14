defmodule ExMonWeb.TrainersController do
  use ExMonWeb, :controller

  alias ExMon.Trainers.{Create, DeleteById, GetById, Update}

  action_fallback ExMonWeb.FallbackController

  def create(conn, params) do
    with {:ok, trainer} <- Create.call(params) do
      put_status(conn, :created)
      |> render(:create, trainer: trainer)
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

  def show(conn, %{"id" => id}) do
    with {:ok, trainer} <- GetById.call(id) do
      put_status(conn, :ok)
      |> render(:show, trainer: trainer)
    else
      {:error, _error} = error -> error
    end
  end

  def update(conn, params) do
    with {:ok, _trainer} <- Update.call(params) do
      put_status(conn, :no_content)
      |> text("")
    else
      {:error, _error} = error -> error
    end
  end
end
