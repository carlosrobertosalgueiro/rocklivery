defmodule Rocklivery do
  alias Rocklivery.Users.Create, as: UserCreate

  defdelegate create_user(params), to: UserCreate, as: :call
end
