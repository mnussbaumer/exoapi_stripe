defmodule ExOAPI.Stripe.Schemas.ChargeOutcome do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:network_status** :: *:string*

  Possible values are `approved_by_network`, `declined_by_network`, `not_sent_to_network`, and `reversed_after_approval`. The value `reversed_after_approval` indicates the payment was [blocked by Stripe](https://stripe.com/docs/declines#blocked-payments) after bank authorization, and may temporarily appear as "pending" on a cardholder's statement.


  **:reason** :: *:string*

  An enumerated value providing a more detailed explanation of the outcome's `type`. Charges blocked by Radar's default block rule have the value `highest_risk_level`. Charges placed in review by Radar's default review rule have the value `elevated_risk_level`. Charges authorized, blocked, or placed in review by custom rules have the value `rule`. See [understanding declines](https://stripe.com/docs/declines) for more details.


  **:risk_level** :: *:string*

  Stripe Radar's evaluation of the riskiness of the payment. Possible values for evaluated payments are `normal`, `elevated`, `highest`. For non-card payments, and card-based payments predating the public assignment of risk levels, this field will have the value `not_assessed`. In the event of an error in the evaluation, this field will have the value `unknown`. This field is only available with Radar.


  **:risk_score** :: *:integer*

  Stripe Radar's evaluation of the riskiness of the payment. Possible values for evaluated payments are between 0 and 100. For non-card payments, card-based payments predating the public assignment of risk scores, or in the event of an error during evaluation, this field will not be present. This field is only available with Radar for Fraud Teams.


  **:rule** :: *ExOAPI.Stripe.Schemas.Rule | :string*

  The ID of the Radar rule that matched the payment, if applicable.


  **:seller_message** :: *:string*

  A human-readable description of the outcome type and reason, designed for you (the recipient of the payment), not your customer.


  **:type** :: *:string*

  Possible values are `authorized`, `manual_review`, `issuer_declined`, `blocked`, and `invalid`. See [understanding declines](https://stripe.com/docs/declines) and [Radar reviews](https://stripe.com/docs/radar/reviews) for details.


  """

  @primary_key false
  typed_embedded_schema do
    field(:network_status, :string)

    field(:reason, :string)

    field(:risk_level, :string)

    field(:risk_score, :integer)

    field(:rule, ExOAPI.EctoTypes.AnyOf, types: [:string, ExOAPI.Stripe.Schemas.Rule])

    field(:seller_message, :string)

    field(:type, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :type,
      :seller_message,
      :rule,
      :risk_score,
      :risk_level,
      :reason,
      :network_status
    ])
    |> validate_required([:type])
  end
end