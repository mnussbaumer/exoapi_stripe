defmodule ExOAPI.Stripe.Schemas.Dispute do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: A dispute occurs when a customer questions your charge with their card issuer.
  When this happens, you're given the opportunity to respond to the dispute with
  evidence that shows that the charge is legitimate. You can find more
  information about the dispute process in our [Disputes and
  Fraud](/docs/disputes) documentation.

  Related guide: [Disputes and Fraud](https://stripe.com/docs/disputes).

  **:amount** :: *:integer*

  Disputed amount. Usually the amount of the charge, but can differ (usually because of currency fluctuation or because only part of the order is disputed).


  **::balance_transactions** :: *ExOAPI.Stripe.Schemas.BalanceTransaction*


  **:charge** :: *ExOAPI.Stripe.Schemas.Charge | :string*

  ID of the charge that was disputed.


  **:created** :: *:integer*

  Time at which the object was created. Measured in seconds since the Unix epoch.


  **:currency** :: *:string*

  Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).


  **:evidence** :: *ExOAPI.Stripe.Schemas.DisputeEvidence*


  **:evidence_details** :: *ExOAPI.Stripe.Schemas.DisputeEvidenceDetails*


  **:id** :: *:string*

  Unique identifier for the object.


  **:is_charge_refundable** :: *:boolean*

  If true, it is still possible to refund the disputed payment. Once the payment has been fully refunded, no further funds will be withdrawn from your Stripe account as a result of this dispute.


  **:livemode** :: *:boolean*

  Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.


  **:metadata** :: *:map*

  Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  **:payment_intent** :: *ExOAPI.Stripe.Schemas.PaymentIntent | :string*

  ID of the PaymentIntent that was disputed.


  **:reason** :: *:string*

  Reason given by cardholder for dispute. Possible values are `bank_cannot_process`, `check_returned`, `credit_not_processed`, `customer_initiated`, `debit_not_authorized`, `duplicate`, `fraudulent`, `general`, `incorrect_account_details`, `insufficient_funds`, `product_not_received`, `product_unacceptable`, `subscription_canceled`, or `unrecognized`. Read more about [dispute reasons](https://stripe.com/docs/disputes/categories).


  **:status** :: *:string*

  Current status of dispute. Possible values are `warning_needs_response`, `warning_under_review`, `warning_closed`, `needs_response`, `under_review`, `charge_refunded`, `won`, or `lost`.


  """

  @primary_key false
  typed_embedded_schema do
    field(:amount, :integer)

    embeds_many(:balance_transactions, ExOAPI.Stripe.Schemas.BalanceTransaction)

    field(:charge, ExOAPI.EctoTypes.AnyOf, types: [:string, ExOAPI.Stripe.Schemas.Charge])

    field(:created, :integer)

    field(:currency, :string)

    embeds_one(:evidence, ExOAPI.Stripe.Schemas.DisputeEvidence)

    embeds_one(:evidence_details, ExOAPI.Stripe.Schemas.DisputeEvidenceDetails)

    field(:id, :string)

    field(:is_charge_refundable, :boolean)

    field(:livemode, :boolean)

    field(:metadata, :map)

    field(:object, Ecto.Enum, values: [:dispute])

    field(:payment_intent, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.PaymentIntent]
    )

    field(:reason, :string)

    field(:status, Ecto.Enum,
      values: [
        :won,
        :warning_under_review,
        :warning_needs_response,
        :warning_closed,
        :under_review,
        :needs_response,
        :lost,
        :charge_refunded
      ]
    )
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :status,
      :reason,
      :payment_intent,
      :object,
      :metadata,
      :livemode,
      :is_charge_refundable,
      :id,
      :currency,
      :created,
      :charge,
      :amount
    ])
    |> validate_required([
      :status,
      :reason,
      :object,
      :metadata,
      :livemode,
      :is_charge_refundable,
      :id,
      :currency,
      :created,
      :charge,
      :amount
    ])
    |> cast_embed(:evidence_details, required: true)
    |> cast_embed(:evidence, required: true)
    |> cast_embed(:balance_transactions, required: true)
  end
end