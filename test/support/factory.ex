defmodule Rocklivery.Factory do
  use ExMachina

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
end
