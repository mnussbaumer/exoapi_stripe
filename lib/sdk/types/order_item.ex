defmodule ExOAPI.Stripe.Schemas.OrderItem do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: A representation of the constituent items of any given order. Can be used to
  represent [SKUs](https://stripe.com/docs/api#skus), shipping costs, or taxes owed on the order.

  Related guide: [Orders](https://stripe.com/docs/orders/guide).

  **:amount** :: *:integer*

  A positive integer in the smallest currency unit (that is, 100 cents for $1.00, or 1 for ¥1, Japanese Yen being a zero-decimal currency) representing the total amount for the line item.


  **:currency** :: *:string*

  Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).


  **:description** :: *:string*

  Description of the line item, meant to be displayable to the user (e.g., `"Express shipping"`).


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  **:parent** :: *ExOAPI.Stripe.Schemas.Sku | :string*

  The ID of the associated object for this line item. Expandable if not null (e.g., expandable to a SKU).


  **:quantity** :: *:integer*

  A positive integer representing the number of instances of `parent` that are included in this order item. Applicable/present only if `type` is `sku`.


  **:type** :: *:string*

  The type of line item. One of `sku`, `tax`, `shipping`, or `discount`.


  """

  @primary_key false
  typed_embedded_schema do
    field(:amount, :integer)

    field(:currency, :string)

    field(:description, :string)

    field(:object, Ecto.Enum, values: [:order_item])

    field(:parent, ExOAPI.EctoTypes.AnyOf, types: [:string, ExOAPI.Stripe.Schemas.Sku])

    field(:quantity, :integer)

    field(:type, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:type, :quantity, :parent, :object, :description, :currency, :amount])
    |> validate_required([:type, :object, :description, :currency, :amount])
  end
end