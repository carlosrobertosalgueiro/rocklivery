defmodule Rocklivery do
  alias Rocklivery.Users.Create, as: UserCreate
  alias Rocklivery.Users.Get, as: UserGet

  defdelegate create_user(params), to: UserCreate, as: :call
  defdelegate get_user_by_id(id), to: UserGet, as: :by_id
end
