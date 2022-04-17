defmodule ExOAPI.Stripe.Schemas.PromotionCode do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: A Promotion Code represents a customer-redeemable code for a coupon. It can be used to
  create multiple codes for a single coupon.

  **:active** :: *:boolean*

  Whether the promotion code is currently active. A promotion code is only active if the coupon is also valid.


  **:code** :: *:string*

  The customer-facing code. Regardless of case, this code must be unique across all active promotion codes for each customer.


  **:coupon** :: *ExOAPI.Stripe.Schemas.Coupon*


  **:created** :: *:integer*

  Time at which the object was created. Measured in seconds since the Unix epoch.


  **:customer** :: *ExOAPI.Stripe.Schemas.DeletedCustomer | ExOAPI.Stripe.Schemas.Customer | :string*

  The customer that this promotion code can be used by.


  **:expires_at** :: *:integer*

  Date at which the promotion code can no longer be redeemed.


  **:id** :: *:string*

  Unique identifier for the object.


  **:livemode** :: *:boolean*

  Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.


  **:max_redemptions** :: *:integer*

  Maximum number of times this promotion code can be redeemed.


  **:metadata** :: *:map*

  Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  **:restrictions** :: *ExOAPI.Stripe.Schemas.PromotionCodesResourceRestrictions*


  **:times_redeemed** :: *:integer*

  Number of times this promotion code has been used.


  """

  @primary_key false
  typed_embedded_schema do
    field(:active, :boolean)

    field(:code, :string)

    embeds_one(:coupon, ExOAPI.Stripe.Schemas.Coupon)

    field(:created, :integer)

    field(:customer, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.Customer, ExOAPI.Stripe.Schemas.DeletedCustomer]
    )

    field(:expires_at, :integer)

    field(:id, :string)

    field(:livemode, :boolean)

    field(:max_redemptions, :integer)

    field(:metadata, :map)

    field(:object, Ecto.Enum, values: [:promotion_code])

    embeds_one(:restrictions, ExOAPI.Stripe.Schemas.PromotionCodesResourceRestrictions)

    field(:times_redeemed, :integer)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :times_redeemed,
      :object,
      :metadata,
      :max_redemptions,
      :livemode,
      :id,
      :expires_at,
      :customer,
      :created,
      :code,
      :active
    ])
    |> validate_required([:times_redeemed, :object, :livemode, :id, :created, :code, :active])
    |> cast_embed(:restrictions, required: true)
    |> cast_embed(:coupon, required: true)
  end
end