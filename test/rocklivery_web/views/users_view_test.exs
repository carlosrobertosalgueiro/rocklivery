defmodule RockliveryWeb.UsersViewTest do
  use RockliveryWeb.ConnCase, async: true

  import Phoenix.View
  import Rocklivery.Factory

  alias RockliveryWeb.UsersView

  test "renders create.json" do
    user = build(:user)

    response = render(UsersView, "create.json", user: user)

    assert response == %{
             message: "User created!",
             user: %Rocklivery.User{
               address: "Rua das bananeiras",
               age: 26,
               cep: "56000000",
               cpf: "32165498712",
               email: "carlosrobertosalgueiro@.com",
               id: "6a34b2ac-9a26-42be-90fe-4e5937618840",
               inserted_at: nil,
               name: "carlos roberto",
               password: "123465",
               password_hash: nil,
               updated_at: nil
             }
           }
  end
end
