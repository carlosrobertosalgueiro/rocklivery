defmodule Rocklivery.Order do
  use Ecto.Schema

  alias Rocklivery.{Item, User}
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  @required_params [:address, :comments, :payment_method, :user_id]
  @payment_method [:money, :credit_card, :debit_card]

  # PASSA OS ENCODES QUE SERÃO MOSTRADOS NA VIEW
  @derive {Jason.Encoder, only: @required_params ++ [:id]}

  schema "items" do
    field :address, :string
    field :comments, :string
    field :payment_method, Ecto.Enum, values: @payment_method

    many_to_many :items, Item, join_through: "orders_items"
    belongs_to :user, User

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params, items) do
    struct
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> put_assoc(:item, items)
    |> validate_length(:address, min: 10)
    |> validate_length(:comments, min: 6)
  end
end
