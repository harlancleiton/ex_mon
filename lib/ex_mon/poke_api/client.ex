defmodule ExMon.PokeAPI.Client do
  use Tesla

  plug Tesla.Middleware.BaseUrl, "https://pokeapi.co/api/v2"
  plug Tesla.Middleware.JSON

  def get_pokemon(name) do
    get("/pokemon/#{name}")
    |> handle_get_pokemon()
  end

  defp handle_get_pokemon({:ok, %Tesla.Env{status: 200, body: %{} = body}}), do: {:ok, body}
  defp handle_get_pokemon({:ok, %Tesla.Env{status: 404}}), do: {:error, "Pokemon not found"}
  defp handle_get_pokemon({:error, _reason} = error), do: error
end
