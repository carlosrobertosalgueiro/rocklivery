defmodule RockliveryWeb.UsersView do
  use RockliveryWeb, :view

  alias Rocklivery.User

  def render("create.json", %{user: %User{} = user}) do
    %{
      message: "User created!",
      user: user
    }
  end
end
