defmodule ExOAPI.Stripe.Schemas.DeletedDiscount do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:checkout_session** :: *:string*

  The Checkout session that this coupon is applied to, if it is applied to a particular session in payment mode. Will not be present for subscription mode.


  **:coupon** :: *ExOAPI.Stripe.Schemas.Coupon*


  **:customer** :: *ExOAPI.Stripe.Schemas.DeletedCustomer | ExOAPI.Stripe.Schemas.Customer | :string*

  The ID of the customer associated with this discount.


  **:deleted** :: *:boolean*

  Always true for a deleted object


  **:id** :: *:string*

  The ID of the discount object. Discounts cannot be fetched by ID. Use `expand[]=discounts` in API calls to expand discount IDs in an array.


  **:invoice** :: *ExOAPI.Stripe.Schemas.Invoice*

  The invoice that the discount's coupon was applied to, if it was applied directly to a particular invoice.


  **:invoice_item** :: *:string*

  The invoice item `id` (or invoice line item `id` for invoice line items of type='subscription') that the discount's coupon was applied to, if it was applied directly to a particular invoice item or invoice line item.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  **:promotion_code** :: *ExOAPI.Stripe.Schemas.PromotionCode | :string*

  The promotion code applied to create this discount.


  **:start** :: *:integer*

  Date that the coupon was applied.


  **:subscription** :: *ExOAPI.Stripe.Schemas.Subscription*

  The subscription that this coupon is applied to, if it is applied to a particular subscription.


  """

  @primary_key false
  typed_embedded_schema do
    field(:checkout_session, :string)

    embeds_one(:coupon, ExOAPI.Stripe.Schemas.Coupon)

    field(:customer, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.Customer, ExOAPI.Stripe.Schemas.DeletedCustomer]
    )

    field(:deleted, :boolean)

    field(:id, :string)

    field(:invoice, :string)

    field(:invoice_item, :string)

    field(:object, Ecto.Enum, values: [:discount])

    field(:promotion_code, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.PromotionCode]
    )

    field(:start, :integer)

    field(:subscription, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :subscription,
      :start,
      :promotion_code,
      :object,
      :invoice_item,
      :invoice,
      :id,
      :deleted,
      :customer,
      :checkout_session
    ])
    |> validate_required([:start, :object, :id, :deleted])
    |> cast_embed(:coupon, required: true)
  end
end