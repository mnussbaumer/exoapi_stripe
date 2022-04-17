defmodule ExOAPI.Stripe.Schemas.Invoiceitem do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: Sometimes you want to add a charge or credit to a customer, but actually
  charge or credit the customer's card only at the end of a regular billing
  cycle. This is useful for combining several charges (to minimize
  per-transaction fees), or for having Stripe tabulate your usage-based billing
  totals.

  Related guide: [Subscription Invoices](https://stripe.com/docs/billing/invoices/subscription#adding-upcoming-invoice-items).

  **:amount** :: *:integer*

  Amount (in the `currency` specified) of the invoice item. This should always be equal to `unit_amount * quantity`.


  **:currency** :: *:string*

  Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).


  **:customer** :: *ExOAPI.Stripe.Schemas.DeletedCustomer | ExOAPI.Stripe.Schemas.Customer | :string*

  The ID of the customer who will be billed when this invoice item is billed.


  **:date** :: *:integer*

  Time at which the object was created. Measured in seconds since the Unix epoch.


  **:description** :: *:string*

  An arbitrary string attached to the object. Often useful for displaying to users.


  **:discountable** :: *:boolean*

  If true, discounts will apply to this invoice item. Always false for prorations.


  **::discounts** :: *ExOAPI.Stripe.Schemas.Discount | :string*


  **:id** :: *:string*

  Unique identifier for the object.


  **:invoice** :: *ExOAPI.Stripe.Schemas.Invoice | :string*

  The ID of the invoice this invoice item belongs to.


  **:livemode** :: *:boolean*

  Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.


  **:metadata** :: *:map*

  Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  **:period** :: *ExOAPI.Stripe.Schemas.InvoiceLineItemPeriod*


  **:price** :: *ExOAPI.Stripe.Schemas.Price*

  The price of the invoice item.


  **:proration** :: *:boolean*

  Whether the invoice item was created automatically as a proration adjustment when the customer switched plans.


  **:quantity** :: *:integer*

  Quantity of units for the invoice item. If the invoice item is a proration, the quantity of the subscription that the proration was computed for.


  **:subscription** :: *ExOAPI.Stripe.Schemas.Subscription | :string*

  The subscription that this invoice item has been created for, if any.


  **:subscription_item** :: *ExOAPI.Stripe.Schemas.SubscriptionItem*

  The subscription item that this invoice item has been created for, if any.


  **::tax_rates** :: *ExOAPI.Stripe.Schemas.TaxRate*


  **:test_clock** :: *ExOAPI.Stripe.Schemas.TestHelpers_testClock | :string*

  ID of the test clock this invoice item belongs to.


  **:unit_amount** :: *:integer*

  Unit amount (in the `currency` specified) of the invoice item.


  **:unit_amount_decimal** :: *:string*

  Same as `unit_amount`, but contains a decimal value with at most 12 decimal places.


  """

  @primary_key false
  typed_embedded_schema do
    field(:amount, :integer)

    field(:currency, :string)

    field(:customer, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.Customer, ExOAPI.Stripe.Schemas.DeletedCustomer]
    )

    field(:date, :integer)

    field(:description, :string)

    field(:discountable, :boolean)

    field(:discounts, {:array, ExOAPI.EctoTypes.AnyOf},
      types: [ExOAPI.Stripe.Schemas.Discount, :string]
    )

    field(:id, :string)

    field(:invoice, ExOAPI.EctoTypes.AnyOf, types: [:string, ExOAPI.Stripe.Schemas.Invoice])

    field(:livemode, :boolean)

    field(:metadata, :map)

    field(:object, Ecto.Enum, values: [:invoiceitem])

    embeds_one(:period, ExOAPI.Stripe.Schemas.InvoiceLineItemPeriod)

    field(:price, ExOAPI.EctoTypes.AnyOf, types: [ExOAPI.Stripe.Schemas.Price])

    field(:proration, :boolean)

    field(:quantity, :integer)

    field(:subscription, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.Subscription]
    )

    field(:subscription_item, :string)

    embeds_many(:tax_rates, ExOAPI.Stripe.Schemas.TaxRate)

    field(:test_clock, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.TestHelpers_testClock]
    )

    field(:unit_amount, :integer)

    field(:unit_amount_decimal, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :unit_amount_decimal,
      :unit_amount,
      :test_clock,
      :subscription_item,
      :subscription,
      :quantity,
      :proration,
      :price,
      :object,
      :metadata,
      :livemode,
      :invoice,
      :id,
      :discounts,
      :discountable,
      :description,
      :date,
      :customer,
      :currency,
      :amount
    ])
    |> validate_required([
      :quantity,
      :proration,
      :object,
      :livemode,
      :id,
      :discountable,
      :date,
      :customer,
      :currency,
      :amount
    ])
    |> cast_embed(:tax_rates)
    |> cast_embed(:period, required: true)
  end
end