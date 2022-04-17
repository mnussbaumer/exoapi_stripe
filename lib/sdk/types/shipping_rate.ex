defmodule ExOAPI.Stripe.Schemas.ShippingRate do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: Shipping rates describe the price of shipping presented to your customers and can be
  applied to [Checkout Sessions](https://stripe.com/docs/payments/checkout/shipping) to collect shipping costs.

  **:active** :: *:boolean*

  Whether the shipping rate can be used for new purchases. Defaults to `true`.


  **:created** :: *:integer*

  Time at which the object was created. Measured in seconds since the Unix epoch.


  **:delivery_estimate** :: *ExOAPI.Stripe.Schemas.ShippingRateDeliveryEstimate*

  The estimated range for how long shipping will take, meant to be displayable to the customer. This will appear on CheckoutSessions.


  **:display_name** :: *:string*

  The name of the shipping rate, meant to be displayable to the customer. This will appear on CheckoutSessions.


  **:fixed_amount** :: *ExOAPI.Stripe.Schemas.ShippingRateFixedAmount*


  **:id** :: *:string*

  Unique identifier for the object.


  **:livemode** :: *:boolean*

  Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.


  **:metadata** :: *:map*

  Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  **:tax_behavior** :: *:string*

  Specifies whether the rate is considered inclusive of taxes or exclusive of taxes. One of `inclusive`, `exclusive`, or `unspecified`.


  **:tax_code** :: *ExOAPI.Stripe.Schemas.TaxCode | :string*

  A [tax code](https://stripe.com/docs/tax/tax-codes) ID. The Shipping tax code is `txcd_92010001`.


  **:type** :: *:string*

  The type of calculation to use on the shipping rate. Can only be `fixed_amount` for now.


  """

  @primary_key false
  typed_embedded_schema do
    field(:active, :boolean)

    field(:created, :integer)

    field(:delivery_estimate, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.ShippingRateDeliveryEstimate]
    )

    field(:display_name, :string)

    embeds_one(:fixed_amount, ExOAPI.Stripe.Schemas.ShippingRateFixedAmount)

    field(:id, :string)

    field(:livemode, :boolean)

    field(:metadata, :map)

    field(:object, Ecto.Enum, values: [:shipping_rate])

    field(:tax_behavior, Ecto.Enum, values: [:unspecified, :inclusive, :exclusive])

    field(:tax_code, ExOAPI.EctoTypes.AnyOf, types: [:string, ExOAPI.Stripe.Schemas.TaxCode])

    field(:type, Ecto.Enum, values: [:fixed_amount])
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :type,
      :tax_code,
      :tax_behavior,
      :object,
      :metadata,
      :livemode,
      :id,
      :display_name,
      :delivery_estimate,
      :created,
      :active
    ])
    |> validate_required([:type, :object, :metadata, :livemode, :id, :created, :active])
    |> cast_embed(:fixed_amount)
  end
end