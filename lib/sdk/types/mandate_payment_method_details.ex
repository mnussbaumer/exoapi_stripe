defmodule ExOAPI.Stripe.Schemas.MandatePaymentMethodDetails do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:acss_debit** :: *ExOAPI.Stripe.Schemas.MandateAcssDebit*


  **:au_becs_debit** :: *ExOAPI.Stripe.Schemas.MandateAuBecsDebit*


  **:bacs_debit** :: *ExOAPI.Stripe.Schemas.MandateBacsDebit*


  **:card** :: *list(:map)*


  **:sepa_debit** :: *ExOAPI.Stripe.Schemas.MandateSepaDebit*


  **:type** :: *:string*

  The type of the payment method associated with this mandate. An additional hash is included on `payment_method_details` with a name matching this value. It contains mandate information specific to the payment method.


  **:us_bank_account** :: *list(:map)*


  """

  @primary_key false
  typed_embedded_schema do
    embeds_one(:acss_debit, ExOAPI.Stripe.Schemas.MandateAcssDebit)

    embeds_one(:au_becs_debit, ExOAPI.Stripe.Schemas.MandateAuBecsDebit)

    embeds_one(:bacs_debit, ExOAPI.Stripe.Schemas.MandateBacsDebit)

    field(:card, {:array, :map})

    embeds_one(:sepa_debit, ExOAPI.Stripe.Schemas.MandateSepaDebit)

    field(:type, :string)

    field(:us_bank_account, {:array, :map})
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:us_bank_account, :type, :card])
    |> validate_required([:type])
    |> cast_embed(:sepa_debit)
    |> cast_embed(:bacs_debit)
    |> cast_embed(:au_becs_debit)
    |> cast_embed(:acss_debit)
  end
end