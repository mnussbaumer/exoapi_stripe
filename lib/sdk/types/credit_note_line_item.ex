defmodule ExOAPI.Stripe.Schemas.CreditNoteLineItem do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:amount** :: *:integer*

  The integer amount in %s representing the gross amount being credited for this line item, excluding (exclusive) tax and discounts.


  **:description** :: *:string*

  Description of the item being credited.


  **:discount_amount** :: *:integer*

  The integer amount in %s representing the discount being credited for this line item.


  **::discount_amounts** :: *ExOAPI.Stripe.Schemas.DiscountsResourceDiscountAmount*


  **:id** :: *:string*

  Unique identifier for the object.


  **:invoice_line_item** :: *:string*

  ID of the invoice line item being credited


  **:livemode** :: *:boolean*

  Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  **:quantity** :: *:integer*

  The number of units of product being credited.


  **::tax_amounts** :: *ExOAPI.Stripe.Schemas.CreditNoteTaxAmount*


  **::tax_rates** :: *ExOAPI.Stripe.Schemas.TaxRate*


  **:type** :: *:string*

  The type of the credit note line item, one of `invoice_line_item` or `custom_line_item`. When the type is `invoice_line_item` there is an additional `invoice_line_item` property on the resource the value of which is the id of the credited line item on the invoice.


  **:unit_amount** :: *:integer*

  The cost of each unit of product being credited.


  **:unit_amount_decimal** :: *:string*

  Same as `unit_amount`, but contains a decimal value with at most 12 decimal places.


  """

  @primary_key false
  typed_embedded_schema do
    field(:amount, :integer)

    field(:description, :string)

    field(:discount_amount, :integer)

    embeds_many(:discount_amounts, ExOAPI.Stripe.Schemas.DiscountsResourceDiscountAmount)

    field(:id, :string)

    field(:invoice_line_item, :string)

    field(:livemode, :boolean)

    field(:object, Ecto.Enum, values: [:credit_note_line_item])

    field(:quantity, :integer)

    embeds_many(:tax_amounts, ExOAPI.Stripe.Schemas.CreditNoteTaxAmount)

    embeds_many(:tax_rates, ExOAPI.Stripe.Schemas.TaxRate)

    field(:type, Ecto.Enum, values: [:invoice_line_item, :custom_line_item])

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
      :type,
      :quantity,
      :object,
      :livemode,
      :invoice_line_item,
      :id,
      :discount_amount,
      :description,
      :amount
    ])
    |> validate_required([:type, :object, :livemode, :id, :discount_amount, :amount])
    |> cast_embed(:tax_rates, required: true)
    |> cast_embed(:tax_amounts, required: true)
    |> cast_embed(:discount_amounts, required: true)
  end
end