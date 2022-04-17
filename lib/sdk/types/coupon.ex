defmodule ExOAPI.Stripe.Schemas.Coupon do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: A coupon contains information about a percent-off or amount-off discount you
  might want to apply to a customer. Coupons may be applied to [invoices](https://stripe.com/docs/api#invoices) or
  [orders](https://stripe.com/docs/api#create_order_legacy-coupon). Coupons do not work with conventional one-off [charges](https://stripe.com/docs/api#create_charge).

  **:amount_off** :: *:integer*

  Amount (in the `currency` specified) that will be taken off the subtotal of any invoices for this customer.


  **:applies_to** :: *ExOAPI.Stripe.Schemas.CouponAppliesTo*


  **:created** :: *:integer*

  Time at which the object was created. Measured in seconds since the Unix epoch.


  **:currency** :: *:string*

  If `amount_off` has been set, the three-letter [ISO code for the currency](https://stripe.com/docs/currencies) of the amount to take off.


  **:duration** :: *:string*

  One of `forever`, `once`, and `repeating`. Describes how long a customer who applies this coupon will get the discount.


  **:duration_in_months** :: *:integer*

  If `duration` is `repeating`, the number of months the coupon applies. Null if coupon `duration` is `forever` or `once`.


  **:id** :: *:string*

  Unique identifier for the object.


  **:livemode** :: *:boolean*

  Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.


  **:max_redemptions** :: *:integer*

  Maximum number of times this coupon can be redeemed, in total, across all customers, before it is no longer valid.


  **:metadata** :: *:map*

  Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.


  **:name** :: *:string*

  Name of the coupon displayed to customers on for instance invoices or receipts.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  **:percent_off** :: *:number*

  Percent that will be taken off the subtotal of any invoices for this customer for the duration of the coupon. For example, a coupon with percent_off of 50 will make a %s100 invoice %s50 instead.


  **:redeem_by** :: *:integer*

  Date after which the coupon can no longer be redeemed.


  **:times_redeemed** :: *:integer*

  Number of times this coupon has been applied to a customer.


  **:valid** :: *:boolean*

  Taking account of the above properties, whether this coupon can still be applied to a customer.


  """

  @primary_key false
  typed_embedded_schema do
    field(:amount_off, :integer)

    embeds_one(:applies_to, ExOAPI.Stripe.Schemas.CouponAppliesTo)

    field(:created, :integer)

    field(:currency, :string)

    field(:duration, Ecto.Enum, values: [:repeating, :once, :forever])

    field(:duration_in_months, :integer)

    field(:id, :string)

    field(:livemode, :boolean)

    field(:max_redemptions, :integer)

    field(:metadata, :map)

    field(:name, :string)

    field(:object, Ecto.Enum, values: [:coupon])

    field(:percent_off, :float)

    field(:redeem_by, :integer)

    field(:times_redeemed, :integer)

    field(:valid, :boolean)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :valid,
      :times_redeemed,
      :redeem_by,
      :percent_off,
      :object,
      :name,
      :metadata,
      :max_redemptions,
      :livemode,
      :id,
      :duration_in_months,
      :duration,
      :currency,
      :created,
      :amount_off
    ])
    |> validate_required([:valid, :times_redeemed, :object, :livemode, :id, :duration, :created])
    |> cast_embed(:applies_to)
  end
end