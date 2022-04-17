defmodule ExOAPI.Stripe.Schemas.SetupIntentPaymentMethodOptions do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:acss_debit** :: *ExOAPI.Stripe.Schemas.SetupIntentTypeSpecificPaymentMethodOptionsClient | ExOAPI.Stripe.Schemas.SetupIntentPaymentMethodOptionsAcssDebit*


  **:card** :: *ExOAPI.Stripe.Schemas.SetupIntentPaymentMethodOptionsCard*


  **:sepa_debit** :: *ExOAPI.Stripe.Schemas.SetupIntentTypeSpecificPaymentMethodOptionsClient | ExOAPI.Stripe.Schemas.SetupIntentPaymentMethodOptionsSepaDebit*


  **:us_bank_account** :: *ExOAPI.Stripe.Schemas.SetupIntentTypeSpecificPaymentMethodOptionsClient | ExOAPI.Stripe.Schemas.SetupIntentPaymentMethodOptionsUsBankAccount*


  """

  @primary_key false
  typed_embedded_schema do
    field(:acss_debit, ExOAPI.EctoTypes.AnyOf,
      types: [
        ExOAPI.Stripe.Schemas.SetupIntentPaymentMethodOptionsAcssDebit,
        ExOAPI.Stripe.Schemas.SetupIntentTypeSpecificPaymentMethodOptionsClient
      ]
    )

    embeds_one(:card, ExOAPI.Stripe.Schemas.SetupIntentPaymentMethodOptionsCard)

    field(:sepa_debit, ExOAPI.EctoTypes.AnyOf,
      types: [
        ExOAPI.Stripe.Schemas.SetupIntentPaymentMethodOptionsSepaDebit,
        ExOAPI.Stripe.Schemas.SetupIntentTypeSpecificPaymentMethodOptionsClient
      ]
    )

    field(:us_bank_account, ExOAPI.EctoTypes.AnyOf,
      types: [
        ExOAPI.Stripe.Schemas.SetupIntentPaymentMethodOptionsUsBankAccount,
        ExOAPI.Stripe.Schemas.SetupIntentTypeSpecificPaymentMethodOptionsClient
      ]
    )
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:us_bank_account, :sepa_debit, :acss_debit])
    |> cast_embed(:card)
  end
end