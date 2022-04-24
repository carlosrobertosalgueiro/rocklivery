defmodule Rocklivery do
  alias Rocklivery.Items.Create, as: ItemCreate
  alias Rocklivery.Orders.Create, as: OrderCreate
  alias Rocklivery.Users.Create, as: UserCreate
  alias Rocklivery.Users.Delete, as: UserDelete
  alias Rocklivery.Users.Get, as: UserGet
  alias Rocklivery.Users.Update, as: UserUpdate

  defdelegate create_user(params), to: UserCreate, as: :call
  defdelegate delete_user(id), to: UserDelete, as: :call
  defdelegate get_user_by_id(id), to: UserGet, as: :by_id
  defdelegate update_user(params), to: UserUpdate, as: :call
  defdelegate create_item(params), to: ItemCreate, as: :call
  defdelegate create_order(params), to: OrderCreate, as: :call
end
