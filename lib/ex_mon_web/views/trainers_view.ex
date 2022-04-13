defmodule ExMonWeb.TrainersView do
  use ExMonWeb, :view

  alias ExMon.Trainers.Trainer

  def render("created.json", %{trainer: %Trainer{id: id, name: name}}) do
    %{id: id, name: name}
  end
end
