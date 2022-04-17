defmodule ExOAPI.Stripe.Schemas.IssuingCardWallets do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:apple_pay** :: *ExOAPI.Stripe.Schemas.IssuingCardApplePay*


  **:google_pay** :: *ExOAPI.Stripe.Schemas.IssuingCardGooglePay*


  **:primary_account_identifier** :: *:string*

  Unique identifier for a card used with digital wallets


  """

  @primary_key false
  typed_embedded_schema do
    embeds_one(:apple_pay, ExOAPI.Stripe.Schemas.IssuingCardApplePay)

    embeds_one(:google_pay, ExOAPI.Stripe.Schemas.IssuingCardGooglePay)

    field(:primary_account_identifier, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:primary_account_identifier])
    |> cast_embed(:google_pay, required: true)
    |> cast_embed(:apple_pay, required: true)
  end
end