defmodule ExOAPI.Stripe.Schemas.Radar_earlyFraudWarning do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: An early fraud warning indicates that the card issuer has notified us that a
  charge may be fraudulent.

  Related guide: [Early Fraud Warnings](https://stripe.com/docs/disputes/measuring#early-fraud-warnings).

  **:actionable** :: *:boolean*

  An EFW is actionable if it has not received a dispute and has not been fully refunded. You may wish to proactively refund a charge that receives an EFW, in order to avoid receiving a dispute later.


  **:charge** :: *ExOAPI.Stripe.Schemas.Charge | :string*

  ID of the charge this early fraud warning is for, optionally expanded.


  **:created** :: *:integer*

  Time at which the object was created. Measured in seconds since the Unix epoch.


  **:fraud_type** :: *:string*

  The type of fraud labelled by the issuer. One of `card_never_received`, `fraudulent_card_application`, `made_with_counterfeit_card`, `made_with_lost_card`, `made_with_stolen_card`, `misc`, `unauthorized_use_of_card`.


  **:id** :: *:string*

  Unique identifier for the object.


  **:livemode** :: *:boolean*

  Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  **:payment_intent** :: *ExOAPI.Stripe.Schemas.PaymentIntent | :string*

  ID of the Payment Intent this early fraud warning is for, optionally expanded.


  """

  @primary_key false
  typed_embedded_schema do
    field(:actionable, :boolean)

    field(:charge, ExOAPI.EctoTypes.AnyOf, types: [:string, ExOAPI.Stripe.Schemas.Charge])

    field(:created, :integer)

    field(:fraud_type, :string)

    field(:id, :string)

    field(:livemode, :boolean)

    field(:object, Ecto.Enum, values: [:"radar.early_fraud_warning"])

    field(:payment_intent, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.PaymentIntent]
    )
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :payment_intent,
      :object,
      :livemode,
      :id,
      :fraud_type,
      :created,
      :charge,
      :actionable
    ])
    |> validate_required([:object, :livemode, :id, :fraud_type, :created, :charge, :actionable])
  end
end