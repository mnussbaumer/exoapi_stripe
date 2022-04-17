defmodule ExOAPI.Stripe.Schemas.CheckoutSessionPaymentMethodOptions do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:acss_debit** :: *ExOAPI.Stripe.Schemas.CheckoutAcssDebitPaymentMethodOptions*


  **:boleto** :: *ExOAPI.Stripe.Schemas.CheckoutBoletoPaymentMethodOptions*


  **:konbini** :: *ExOAPI.Stripe.Schemas.CheckoutKonbiniPaymentMethodOptions*


  **:oxxo** :: *ExOAPI.Stripe.Schemas.CheckoutOxxoPaymentMethodOptions*


  **:us_bank_account** :: *ExOAPI.Stripe.Schemas.CheckoutUsBankAccountPaymentMethodOptions*


  """

  @primary_key false
  typed_embedded_schema do
    embeds_one(:acss_debit, ExOAPI.Stripe.Schemas.CheckoutAcssDebitPaymentMethodOptions)

    embeds_one(:boleto, ExOAPI.Stripe.Schemas.CheckoutBoletoPaymentMethodOptions)

    embeds_one(:konbini, ExOAPI.Stripe.Schemas.CheckoutKonbiniPaymentMethodOptions)

    embeds_one(:oxxo, ExOAPI.Stripe.Schemas.CheckoutOxxoPaymentMethodOptions)

    embeds_one(:us_bank_account, ExOAPI.Stripe.Schemas.CheckoutUsBankAccountPaymentMethodOptions)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [])
    |> cast_embed(:us_bank_account)
    |> cast_embed(:oxxo)
    |> cast_embed(:konbini)
    |> cast_embed(:boleto)
    |> cast_embed(:acss_debit)
  end
end