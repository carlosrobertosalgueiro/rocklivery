defmodule Rocklivery.Orders.Create do
  import Ecto.Query

  alias Rocklivery.{Item, Repo}

    def call(params) do
      fetch_items(  params)
    end

    defp fetch_items(%{"items" => items_params}) do

      items_ids =Enum.map(items_params, fn item -> item["id"] end)

      query = from item in Item, where: item.id in ^items_ids

      query
      |> Repo.all()
      |> validate_and_multiply_items(items_ids,items_params)
    end

    defp validate_and_multiply_items(items, items_ids, items_params) do
      items_map = Map.new(items, fn item -> {item.id, item} end)

      items_ids
      |> Enum.map(fn id -> {id, Map.get(items_map, id)}end)
      |> Enum.any?(fn {_id, value} -> is_nil(value) end)
      |> multiply_items(items_map, items_params)
    end

    defp multiply_items(true, _items, _items_params), do: {:error, "invalid ids!"}

    defp multiply_items(false, items, items_params) do
     items =
      Enum.reduce(items_params, [], fn %{"id" => id, "quantity" => quantity}, acc ->
        item = Map.get(items, id)
        acc ++ List.duplicate(item, quantity)
      end)
    {:ok, items}
    end
end
