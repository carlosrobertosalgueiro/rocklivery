defmodule RockliveryWeb.OrdersView do
  use RockliveryWeb, :view

  alias Rocklivery.Order

  def render("create.json", %{order: %Order{} = order}) do
    %{
      message: "Order created!",
      order: order
    }
  end
end
