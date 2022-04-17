defmodule ExOAPI.Stripe.Schemas.AccountSettings do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:bacs_debit_payments** :: *ExOAPI.Stripe.Schemas.AccountBacsDebitPaymentsSettings*


  **:branding** :: *ExOAPI.Stripe.Schemas.AccountBrandingSettings*


  **:card_issuing** :: *ExOAPI.Stripe.Schemas.AccountCardIssuingSettings*


  **:card_payments** :: *ExOAPI.Stripe.Schemas.AccountCardPaymentsSettings*


  **:dashboard** :: *ExOAPI.Stripe.Schemas.AccountDashboardSettings*


  **:payments** :: *ExOAPI.Stripe.Schemas.AccountPaymentsSettings*


  **:payouts** :: *ExOAPI.Stripe.Schemas.AccountPayoutSettings*


  **:sepa_debit_payments** :: *ExOAPI.Stripe.Schemas.AccountSepaDebitPaymentsSettings*


  """

  @primary_key false
  typed_embedded_schema do
    embeds_one(:bacs_debit_payments, ExOAPI.Stripe.Schemas.AccountBacsDebitPaymentsSettings)

    embeds_one(:branding, ExOAPI.Stripe.Schemas.AccountBrandingSettings)

    embeds_one(:card_issuing, ExOAPI.Stripe.Schemas.AccountCardIssuingSettings)

    embeds_one(:card_payments, ExOAPI.Stripe.Schemas.AccountCardPaymentsSettings)

    embeds_one(:dashboard, ExOAPI.Stripe.Schemas.AccountDashboardSettings)

    embeds_one(:payments, ExOAPI.Stripe.Schemas.AccountPaymentsSettings)

    embeds_one(:payouts, ExOAPI.Stripe.Schemas.AccountPayoutSettings)

    embeds_one(:sepa_debit_payments, ExOAPI.Stripe.Schemas.AccountSepaDebitPaymentsSettings)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [])
    |> cast_embed(:sepa_debit_payments)
    |> cast_embed(:payouts)
    |> cast_embed(:payments, required: true)
    |> cast_embed(:dashboard, required: true)
    |> cast_embed(:card_payments, required: true)
    |> cast_embed(:card_issuing)
    |> cast_embed(:branding, required: true)
    |> cast_embed(:bacs_debit_payments)
  end
end