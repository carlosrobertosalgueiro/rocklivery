defmodule RockliveryWeb.UsersController do
  use RockliveryWeb, :controller

  alias Rocklivery.User

  def create(conn, params) do
    with {:ok, %User{} = user} <- Rocklivery.create_user(params) do
      conn
      |> put_status(:created)
      |> render("create.json", user: user)
    end
  end
end
