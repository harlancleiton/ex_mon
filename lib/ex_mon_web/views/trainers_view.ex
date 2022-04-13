defmodule ExMonWeb.TrainersView do
  use ExMonWeb, :view

  alias ExMon.Trainers.Trainer

  def render("create.json", %{trainer: %Trainer{id: id, name: name}}) do
    %{id: id, name: name}
  end

  def render("show.json", %{trainer: %Trainer{id: id, name: name}}) do
    %{id: id, name: name}
  end
end
