defmodule ExOAPI.Stripe.Schemas.LineItem do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:amount** :: *:integer*

  The amount, in %s.


  **:currency** :: *:string*

  Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).


  **:description** :: *:string*

  An arbitrary string attached to the object. Often useful for displaying to users.


  **::discount_amounts** :: *ExOAPI.Stripe.Schemas.DiscountsResourceDiscountAmount*


  **:discountable** :: *:boolean*

  If true, discounts will apply to this line item. Always false for prorations.


  **::discounts** :: *ExOAPI.Stripe.Schemas.Discount | :string*


  **:id** :: *:string*

  Unique identifier for the object.


  **:invoice_item** :: *:string*

  The ID of the [invoice item](https://stripe.com/docs/api/invoiceitems) associated with this line item if any.


  **:livemode** :: *:boolean*

  Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.


  **:metadata** :: *:map*

  Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Note that for line items with `type=subscription` this will reflect the metadata of the subscription that caused the line item to be created.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  **:period** :: *ExOAPI.Stripe.Schemas.InvoiceLineItemPeriod*


  **:price** :: *ExOAPI.Stripe.Schemas.Price*

  The price of the line item.


  **:proration** :: *:boolean*

  Whether this is a proration.


  **:proration_details** :: *ExOAPI.Stripe.Schemas.InvoicesLineItemsProrationDetails*

  Additional details for proration line items


  **:quantity** :: *:integer*

  The quantity of the subscription, if the line item is a subscription or a proration.


  **:subscription** :: *ExOAPI.Stripe.Schemas.Subscription*

  The subscription that the invoice item pertains to, if any.


  **:subscription_item** :: *ExOAPI.Stripe.Schemas.SubscriptionItem*

  The subscription item that generated this invoice item. Left empty if the line item is not an explicit result of a subscription.


  **::tax_amounts** :: *ExOAPI.Stripe.Schemas.InvoiceTaxAmount*


  **::tax_rates** :: *ExOAPI.Stripe.Schemas.TaxRate*


  **:type** :: *:string*

  A string identifying the type of the source of this line item, either an `invoiceitem` or a `subscription`.


  """

  @primary_key false
  typed_embedded_schema do
    field(:amount, :integer)

    field(:currency, :string)

    field(:description, :string)

    embeds_many(:discount_amounts, ExOAPI.Stripe.Schemas.DiscountsResourceDiscountAmount)

    field(:discountable, :boolean)

    field(:discounts, {:array, ExOAPI.EctoTypes.AnyOf},
      types: [ExOAPI.Stripe.Schemas.Discount, :string]
    )

    field(:id, :string)

    field(:invoice_item, :string)

    field(:livemode, :boolean)

    field(:metadata, :map)

    field(:object, Ecto.Enum, values: [:line_item])

    embeds_one(:period, ExOAPI.Stripe.Schemas.InvoiceLineItemPeriod)

    field(:price, ExOAPI.EctoTypes.AnyOf, types: [ExOAPI.Stripe.Schemas.Price])

    field(:proration, :boolean)

    field(:proration_details, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.InvoicesLineItemsProrationDetails]
    )

    field(:quantity, :integer)

    field(:subscription, :string)

    field(:subscription_item, :string)

    embeds_many(:tax_amounts, ExOAPI.Stripe.Schemas.InvoiceTaxAmount)

    embeds_many(:tax_rates, ExOAPI.Stripe.Schemas.TaxRate)

    field(:type, Ecto.Enum, values: [:subscription, :invoiceitem])
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :type,
      :subscription_item,
      :subscription,
      :quantity,
      :proration_details,
      :proration,
      :price,
      :object,
      :metadata,
      :livemode,
      :invoice_item,
      :id,
      :discounts,
      :discountable,
      :description,
      :currency,
      :amount
    ])
    |> validate_required([
      :type,
      :proration,
      :object,
      :metadata,
      :livemode,
      :id,
      :discountable,
      :currency,
      :amount
    ])
    |> cast_embed(:tax_rates)
    |> cast_embed(:tax_amounts)
    |> cast_embed(:period, required: true)
    |> cast_embed(:discount_amounts)
  end
end