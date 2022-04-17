defmodule ExOAPI.Stripe.Schemas.OrderReturn do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: A return represents the full or partial return of a number of [order items](https://stripe.com/docs/api#order_items).
  Returns always belong to an order, and may optionally contain a refund.

  Related guide: [Handling Returns](https://stripe.com/docs/orders/guide#handling-returns).

  **:amount** :: *:integer*

  A positive integer in the smallest currency unit (that is, 100 cents for $1.00, or 1 for ¥1, Japanese Yen being a zero-decimal currency) representing the total amount for the returned line item.


  **:created** :: *:integer*

  Time at which the object was created. Measured in seconds since the Unix epoch.


  **:currency** :: *:string*

  Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).


  **:id** :: *:string*

  Unique identifier for the object.


  **::items** :: *ExOAPI.Stripe.Schemas.OrderItem*


  **:livemode** :: *:boolean*

  Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  **:order** :: *ExOAPI.Stripe.Schemas.Order | :string*

  The order that this return includes items from.


  **:refund** :: *ExOAPI.Stripe.Schemas.Refund | :string*

  The ID of the refund issued for this return.


  """

  @primary_key false
  typed_embedded_schema do
    field(:amount, :integer)

    field(:created, :integer)

    field(:currency, :string)

    field(:id, :string)

    embeds_many(:items, ExOAPI.Stripe.Schemas.OrderItem)

    field(:livemode, :boolean)

    field(:object, Ecto.Enum, values: [:order_return])

    field(:order, ExOAPI.EctoTypes.AnyOf, types: [:string, ExOAPI.Stripe.Schemas.Order])

    field(:refund, ExOAPI.EctoTypes.AnyOf, types: [:string, ExOAPI.Stripe.Schemas.Refund])
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:refund, :order, :object, :livemode, :id, :currency, :created, :amount])
    |> validate_required([:object, :livemode, :id, :currency, :created, :amount])
    |> cast_embed(:items, required: true)
  end
end