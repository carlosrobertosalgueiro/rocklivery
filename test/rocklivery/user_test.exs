defmodule Rocklivery.UserTest do
  use Rocklivery.DataCase, async: true

  alias Ecto.Changeset
  alias Rocklivery.User

  describe "changeset/2" do
    test "when all params are valid, returns a valid changeset" do
      params = %{
        address: "Rua das bananeiras",
        age: 26,
        cep: "56000000",
        cpf: "32165498712",
        email: "carlosrobertosalgueiro@.com",
        password: "123456",
        name: "carlos roberto"
      }

      response = User.changeset(params)

      assert %Changeset{changes: %{name: "carlos roberto"}, valid?: true} = response
    end

    test "when updating a changeset, returns a valid changeset with the given changes" do
      params = %{
        address: "Rua das bananeiras",
        age: 26,
        cep: "56000000",
        cpf: "32165498712",
        email: "carlosrobertosalgueiro@.com",
        password: "123456",
        name: "carlos roberto"
      }

      update_params = %{name: "carlinhos", password: "123456"}

      response =
        params
        |> User.changeset()
        |> User.changeset(update_params)

      assert %Changeset{changes: %{name: "carlinhos"}, valid?: true} = response
    end

    test "when there are some error, returns an invalid changeset" do
      params = %{
        address: "Rua das bananeiras",
        age: 15,
        cep: "56000000",
        cpf: "32165498712",
        email: "carlosrobertosalgueiro@.com",
        password: "123",
        name: "carlos roberto"
      }

      response = User.changeset(params)

      expected_response = %{
        age: ["must be greater than or equal to 18"],
        password: ["should be at least 6 character(s)"]
      }

      assert errors_on(response) == expected_response
    end
  end
end
