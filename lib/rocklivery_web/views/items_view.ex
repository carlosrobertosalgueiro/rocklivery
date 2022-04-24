defmodule RockliveryWeb.ItemsView do
  use RockliveryWeb, :view

  alias Rocklivery.Item

  def render("create.json", %{item: %Item{} = item}) do
    %{
      message: "Item created!",
      item: item
    }
  end
end
