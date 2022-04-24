defmodule RockliveryWeb.OrdersController do
  use RockliveryWeb, :controller

  alias Rocklivery.Order
  alias RockliveryWeb.FallbackController

  action_fallback(FallbackController)

  def create(conn, params) do
    with {:ok, %Order{} = order} <- Rocklivery.create_order(params) do
      conn
      |> put_status(:created)
      |> render("create.json", order: order)
    end
  end
end
