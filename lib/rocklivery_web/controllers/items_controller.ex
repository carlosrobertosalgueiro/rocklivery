defmodule RockliveryWeb.ItemsController do
  use RockliveryWeb, :controller

  alias Rocklivery.Item
  alias RockliveryWeb.FallbackController

  action_fallback(FallbackController)

  def create(conn, params) do
    with {:ok, %Item{} = item} <- Rocklivery.create_item(params) do
      conn
      |> put_status(:created)
      |> render("create.json", item: item)
    end
  end
end
