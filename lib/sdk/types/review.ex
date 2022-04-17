defmodule ExOAPI.Stripe.Schemas.Review do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: Reviews can be used to supplement automated fraud detection with human expertise.

  Learn more about [Radar](/radar) and reviewing payments
  [here](https://stripe.com/docs/radar/reviews).

  **:billing_zip** :: *:string*

  The ZIP or postal code of the card used, if applicable.


  **:charge** :: *ExOAPI.Stripe.Schemas.Charge | :string*

  The charge associated with this review.


  **:closed_reason** :: *:string*

  The reason the review was closed, or null if it has not yet been closed. One of `approved`, `refunded`, `refunded_as_fraud`, `disputed`, or `redacted`.


  **:created** :: *:integer*

  Time at which the object was created. Measured in seconds since the Unix epoch.


  **:id** :: *:string*

  Unique identifier for the object.


  **:ip_address** :: *:string*

  The IP address where the payment originated.


  **:ip_address_location** :: *ExOAPI.Stripe.Schemas.RadarReviewResourceLocation*

  Information related to the location of the payment. Note that this information is an approximation and attempts to locate the nearest population center - it should not be used to determine a specific address.


  **:livemode** :: *:boolean*

  Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  **:open** :: *:boolean*

  If `true`, the review needs action.


  **:opened_reason** :: *:string*

  The reason the review was opened. One of `rule` or `manual`.


  **:payment_intent** :: *ExOAPI.Stripe.Schemas.PaymentIntent | :string*

  The PaymentIntent ID associated with this review, if one exists.


  **:reason** :: *:string*

  The reason the review is currently open or closed. One of `rule`, `manual`, `approved`, `refunded`, `refunded_as_fraud`, `disputed`, or `redacted`.


  **:session** :: *ExOAPI.Stripe.Schemas.RadarReviewResourceSession*

  Information related to the browsing session of the user who initiated the payment.


  """

  @primary_key false
  typed_embedded_schema do
    field(:billing_zip, :string)

    field(:charge, ExOAPI.EctoTypes.AnyOf, types: [:string, ExOAPI.Stripe.Schemas.Charge])

    field(:closed_reason, Ecto.Enum,
      values: [:refunded_as_fraud, :refunded, :redacted, :disputed, :approved]
    )

    field(:created, :integer)

    field(:id, :string)

    field(:ip_address, :string)

    field(:ip_address_location, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.RadarReviewResourceLocation]
    )

    field(:livemode, :boolean)

    field(:object, Ecto.Enum, values: [:review])

    field(:open, :boolean)

    field(:opened_reason, Ecto.Enum, values: [:rule, :manual])

    field(:payment_intent, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.PaymentIntent]
    )

    field(:reason, :string)

    field(:session, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.RadarReviewResourceSession]
    )
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :session,
      :reason,
      :payment_intent,
      :opened_reason,
      :open,
      :object,
      :livemode,
      :ip_address_location,
      :ip_address,
      :id,
      :created,
      :closed_reason,
      :charge,
      :billing_zip
    ])
    |> validate_required([:reason, :opened_reason, :open, :object, :livemode, :id, :created])
  end
end