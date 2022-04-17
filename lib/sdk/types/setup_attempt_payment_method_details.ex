defmodule ExOAPI.Stripe.Schemas.SetupAttemptPaymentMethodDetails do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:acss_debit** :: *list(:map)*


  **:au_becs_debit** :: *list(:map)*


  **:bacs_debit** :: *list(:map)*


  **:bancontact** :: *ExOAPI.Stripe.Schemas.SetupAttemptPaymentMethodDetailsBancontact*


  **:boleto** :: *list(:map)*


  **:card** :: *ExOAPI.Stripe.Schemas.SetupAttemptPaymentMethodDetailsCard*


  **:card_present** :: *ExOAPI.Stripe.Schemas.SetupAttemptPaymentMethodDetailsCardPresent*


  **:ideal** :: *ExOAPI.Stripe.Schemas.SetupAttemptPaymentMethodDetailsIdeal*


  **:sepa_debit** :: *list(:map)*


  **:sofort** :: *ExOAPI.Stripe.Schemas.SetupAttemptPaymentMethodDetailsSofort*


  **:type** :: *:string*

  The type of the payment method used in the SetupIntent (e.g., `card`). An additional hash is included on `payment_method_details` with a name matching this value. It contains confirmation-specific information for the payment method.


  **:us_bank_account** :: *list(:map)*


  """

  @primary_key false
  typed_embedded_schema do
    field(:acss_debit, {:array, :map})

    field(:au_becs_debit, {:array, :map})

    field(:bacs_debit, {:array, :map})

    embeds_one(:bancontact, ExOAPI.Stripe.Schemas.SetupAttemptPaymentMethodDetailsBancontact)

    field(:boleto, {:array, :map})

    embeds_one(:card, ExOAPI.Stripe.Schemas.SetupAttemptPaymentMethodDetailsCard)

    embeds_one(:card_present, ExOAPI.Stripe.Schemas.SetupAttemptPaymentMethodDetailsCardPresent)

    embeds_one(:ideal, ExOAPI.Stripe.Schemas.SetupAttemptPaymentMethodDetailsIdeal)

    field(:sepa_debit, {:array, :map})

    embeds_one(:sofort, ExOAPI.Stripe.Schemas.SetupAttemptPaymentMethodDetailsSofort)

    field(:type, :string)

    field(:us_bank_account, {:array, :map})
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :us_bank_account,
      :type,
      :sepa_debit,
      :boleto,
      :bacs_debit,
      :au_becs_debit,
      :acss_debit
    ])
    |> validate_required([:type])
    |> cast_embed(:sofort)
    |> cast_embed(:ideal)
    |> cast_embed(:card_present)
    |> cast_embed(:card)
    |> cast_embed(:bancontact)
  end
end