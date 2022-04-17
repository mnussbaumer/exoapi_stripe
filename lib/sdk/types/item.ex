defmodule ExOAPI.Stripe.Schemas.Item do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: A line item.

  **:amount_subtotal** :: *:integer*

  Total before any discounts or taxes are applied.


  **:amount_total** :: *:integer*

  Total after discounts and taxes.


  **:currency** :: *:string*

  Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).


  **:description** :: *:string*

  An arbitrary string attached to the object. Often useful for displaying to users. Defaults to product name.


  **::discounts** :: *ExOAPI.Stripe.Schemas.LineItemsDiscountAmount*


  **:id** :: *:string*

  Unique identifier for the object.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  **:price** :: *ExOAPI.Stripe.Schemas.Price*

  The price used to generate the line item.


  **:quantity** :: *:integer*

  The quantity of products being purchased.


  **::taxes** :: *ExOAPI.Stripe.Schemas.LineItemsTaxAmount*


  """

  @primary_key false
  typed_embedded_schema do
    field(:amount_subtotal, :integer)

    field(:amount_total, :integer)

    field(:currency, :string)

    field(:description, :string)

    embeds_many(:discounts, ExOAPI.Stripe.Schemas.LineItemsDiscountAmount)

    field(:id, :string)

    field(:object, Ecto.Enum, values: [:item])

    field(:price, ExOAPI.EctoTypes.AnyOf, types: [ExOAPI.Stripe.Schemas.Price])

    field(:quantity, :integer)

    embeds_many(:taxes, ExOAPI.Stripe.Schemas.LineItemsTaxAmount)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :quantity,
      :price,
      :object,
      :id,
      :description,
      :currency,
      :amount_total,
      :amount_subtotal
    ])
    |> validate_required([:object, :id, :description, :currency, :amount_total, :amount_subtotal])
    |> cast_embed(:taxes)
    |> cast_embed(:discounts)
  end
end