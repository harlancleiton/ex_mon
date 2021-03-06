defmodule ExMon.Pokemons.Pokemon do
  @required_keys [:id, :name, :weight, :types]

  @enforce_keys @required_keys

  defstruct @required_keys

  def build(%{"id" => id, "name" => name, "weight" => weight, "types" => types}) do
    %__MODULE__{
      id: id,
      name: name,
      weight: weight,
      types: parse_types(types)
    }
  end

  defp parse_types(types) do
    types
    |> Enum.map(fn item -> item["type"]["name"] end)
  end
end
