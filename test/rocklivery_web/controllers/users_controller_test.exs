defmodule RockliveryWeb.UsersControllerTest do
  use RockliveryWeb.ConnCase, async: true

  import Rocklivery.Factory

  describe "create/2" do
    test "when all params are valid, creates the user", %{conn: conn} do
      params = %{
        "address" => "Rua das bananeiras",
        "age" => 26,
        "cep" => "56000000",
        "cpf" => "32165498712",
        "email" => "carlosrobertosalgueiro@.com",
        "password" => "123465",
        "name" => "carlos roberto"
      }

      response =
        conn
        |> post(Routes.users_path(conn, :create, params))
        |> json_response(:created)

      expected_response = %{
        "message" => "User created!",
        "user" => %{
          "age" => 26,
          "cpf" => "32165498712",
          "email" => "carlosrobertosalgueiro@.com",
          "name" => "carlos roberto",
          "id" => "_id"
        }
      }

      assert response = expected_response
    end

    test "when there is some error, returns the error", %{conn: conn} do
      params = %{
        "password" => "123465",
        "name" => "carlos roberto"
      }

      response =
        conn
        |> post(Routes.users_path(conn, :create, params))
        |> json_response(:bad_request)

      expected_response = %{
        "message" => %{
          "address" => ["can't be blank"],
          "age" => ["can't be blank"],
          "cep" => ["can't be blank"],
          "cpf" => ["can't be blank"],
          "email" => ["can't be blank"]
        }
      }

      assert response == expected_response
    end
  end

  describe "delete/2" do
    test "when there is a user with the given id, deletes the user", %{conn: conn} do
      id = "6a34b2ac-9a26-42be-90fe-4e5937618840"

      insert(:user)

      response =
        conn
        |> delete(Routes.users_path(conn, :delete, id))
        |> response(:no_content)

      assert response == ""
    end
  end
end
