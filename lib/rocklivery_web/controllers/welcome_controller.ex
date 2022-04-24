defmodule RockliveryWeb.Welcomecontroller do
  use RockliveryWeb, :controller

  def index(conn, _params) do
    conn
    |> put_status(:ok)
    |> text("welcome, carlos:)")
  end
end
