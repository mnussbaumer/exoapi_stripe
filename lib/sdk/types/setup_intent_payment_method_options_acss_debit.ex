defmodule ExOAPI.Stripe.Schemas.SetupIntentPaymentMethodOptionsAcssDebit do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:currency** :: *:string*

  Currency supported by the bank account


  **:mandate_options** :: *ExOAPI.Stripe.Schemas.SetupIntentPaymentMethodOptionsMandateOptionsAcssDebit*


  **:verification_method** :: *:string*

  Bank account verification method.


  """

  @primary_key false
  typed_embedded_schema do
    field(:currency, Ecto.Enum, values: [:usd, :cad])

    embeds_one(
      :mandate_options,
      ExOAPI.Stripe.Schemas.SetupIntentPaymentMethodOptionsMandateOptionsAcssDebit
    )

    field(:verification_method, Ecto.Enum, values: [:microdeposits, :instant, :automatic])
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:verification_method, :currency])
    |> cast_embed(:mandate_options)
  end
end