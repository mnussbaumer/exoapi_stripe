defmodule ExOAPI.Stripe.Schemas.CreditNote do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: Issue a credit note to adjust an invoice's amount after the invoice is finalized.

  Related guide: [Credit Notes](https://stripe.com/docs/billing/invoices/credit-notes).

  **:amount** :: *:integer*

  The integer amount in %s representing the total amount of the credit note, including tax.


  **:created** :: *:integer*

  Time at which the object was created. Measured in seconds since the Unix epoch.


  **:currency** :: *:string*

  Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).


  **:customer** :: *ExOAPI.Stripe.Schemas.DeletedCustomer | ExOAPI.Stripe.Schemas.Customer | :string*

  ID of the customer.


  **:customer_balance_transaction** :: *ExOAPI.Stripe.Schemas.CustomerBalanceTransaction | :string*

  Customer balance transaction related to this credit note.


  **:discount_amount** :: *:integer*

  The integer amount in %s representing the total amount of discount that was credited.


  **::discount_amounts** :: *ExOAPI.Stripe.Schemas.DiscountsResourceDiscountAmount*


  **:id** :: *:string*

  Unique identifier for the object.


  **:invoice** :: *ExOAPI.Stripe.Schemas.Invoice | :string*

  ID of the invoice.


  **::data** :: *ExOAPI.Stripe.Schemas.CreditNoteLineItem*


  **:has_more** :: *:boolean*

  True if this list has another page of items after this one that can be fetched.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value. Always has the value `list`.


  **:url** :: *:string*

  The URL where this list can be accessed.


  **:livemode** :: *:boolean*

  Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.


  **:memo** :: *:string*

  Customer-facing text that appears on the credit note PDF.


  **:metadata** :: *:map*

  Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.


  **:number** :: *:string*

  A unique number that identifies this particular credit note and appears on the PDF of the credit note and its associated invoice.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  **:out_of_band_amount** :: *:integer*

  Amount that was credited outside of Stripe.


  **:pdf** :: *:string*

  The link to download the PDF of the credit note.


  **:reason** :: *:string*

  Reason for issuing this credit note, one of `duplicate`, `fraudulent`, `order_change`, or `product_unsatisfactory`


  **:refund** :: *ExOAPI.Stripe.Schemas.Refund | :string*

  Refund related to this credit note.


  **:status** :: *:string*

  Status of this credit note, one of `issued` or `void`. Learn more about [voiding credit notes](https://stripe.com/docs/billing/invoices/credit-notes#voiding).


  **:subtotal** :: *:integer*

  The integer amount in %s representing the amount of the credit note, excluding tax and invoice level discounts.


  **::tax_amounts** :: *ExOAPI.Stripe.Schemas.CreditNoteTaxAmount*


  **:total** :: *:integer*

  The integer amount in %s representing the total amount of the credit note, including tax and all discount.


  **:type** :: *:string*

  Type of this credit note, one of `pre_payment` or `post_payment`. A `pre_payment` credit note means it was issued when the invoice was open. A `post_payment` credit note means it was issued when the invoice was paid.


  **:voided_at** :: *:integer*

  The time that the credit note was voided.


  """

  @primary_key false
  typed_embedded_schema do
    field(:amount, :integer)

    field(:created, :integer)

    field(:currency, :string)

    field(:customer, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.Customer, ExOAPI.Stripe.Schemas.DeletedCustomer]
    )

    field(:customer_balance_transaction, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.CustomerBalanceTransaction]
    )

    field(:discount_amount, :integer)

    embeds_many(:discount_amounts, ExOAPI.Stripe.Schemas.DiscountsResourceDiscountAmount)

    field(:id, :string)

    field(:invoice, ExOAPI.EctoTypes.AnyOf, types: [:string, ExOAPI.Stripe.Schemas.Invoice])

    field(:lines, :map)

    field(:livemode, :boolean)

    field(:memo, :string)

    field(:metadata, :map)

    field(:number, :string)

    field(:object, Ecto.Enum, values: [:credit_note])

    field(:out_of_band_amount, :integer)

    field(:pdf, :string)

    field(:reason, Ecto.Enum,
      values: [:product_unsatisfactory, :order_change, :fraudulent, :duplicate]
    )

    field(:refund, ExOAPI.EctoTypes.AnyOf, types: [:string, ExOAPI.Stripe.Schemas.Refund])

    field(:status, Ecto.Enum, values: [:void, :issued])

    field(:subtotal, :integer)

    embeds_many(:tax_amounts, ExOAPI.Stripe.Schemas.CreditNoteTaxAmount)

    field(:total, :integer)

    field(:type, Ecto.Enum, values: [:pre_payment, :post_payment])

    field(:voided_at, :integer)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :voided_at,
      :type,
      :total,
      :subtotal,
      :status,
      :refund,
      :reason,
      :pdf,
      :out_of_band_amount,
      :object,
      :number,
      :metadata,
      :memo,
      :livemode,
      :lines,
      :invoice,
      :id,
      :discount_amount,
      :customer_balance_transaction,
      :customer,
      :currency,
      :created,
      :amount
    ])
    |> validate_required([
      :type,
      :total,
      :subtotal,
      :status,
      :pdf,
      :object,
      :number,
      :livemode,
      :lines,
      :invoice,
      :id,
      :discount_amount,
      :customer,
      :currency,
      :created,
      :amount
    ])
    |> cast_embed(:tax_amounts, required: true)
    |> cast_embed(:discount_amounts, required: true)
  end
end