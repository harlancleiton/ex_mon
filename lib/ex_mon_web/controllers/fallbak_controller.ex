defmodule ExMonWeb.FallbackController do
  use ExMonWeb, :controller

  alias Ecto.Changeset

  def call(conn, {:error, %Changeset{} = changeset}) do
    conn
    |> put_status(:bad_request)
    |> put_view(ExMonWeb.ErrorView)
    |> render(:error, changeset: changeset)
  end

  def call(conn, {:error, msg} = error) when is_bitstring(msg) do
    conn
    # TODO add custom Error
    |> put_status(:bad_request)
    |> put_view(ExMonWeb.ErrorView)
    |> render(:error, error: error)
  end
end
