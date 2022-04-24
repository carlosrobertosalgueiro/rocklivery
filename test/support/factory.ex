defmodule Rocklivery.Factory do
  use ExMachina.Ecto, repo: Rocklivery.Repo

  alias Rocklivery.User

  def user_params_factory do
    %{
      address: "Rua das bananeiras",
      age: 26,
      cep: "56000000",
      cpf: "32165498712",
      email: "carlosrobertosalgueiro@.com",
      password: "123465",
      name: "carlos roberto"
    }
  end

  def user_factory do
    %User{
      address: "Rua das bananeiras",
      age: 26,
      cep: "56000000",
      cpf: "32165498712",
      email: "carlosrobertosalgueiro@.com",
      password: "123465",
      name: "carlos roberto",
      id: "6a34b2ac-9a26-42be-90fe-4e5937618840"
    }
  end
end
