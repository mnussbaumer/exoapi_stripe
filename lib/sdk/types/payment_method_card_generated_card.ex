defmodule ExOAPI.Stripe.Schemas.PaymentMethodCardGeneratedCard do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:charge** :: *ExOAPI.Stripe.Schemas.Charge*

  The charge that created this object.


  **:payment_method_details** :: *ExOAPI.Stripe.Schemas.CardGeneratedFromPaymentMethodDetails*

  Transaction-specific details of the payment method used in the payment.


  **:setup_attempt** :: *ExOAPI.Stripe.Schemas.SetupAttempt | :string*

  The ID of the SetupAttempt that generated this PaymentMethod, if any.


  """

  @primary_key false
  typed_embedded_schema do
    field(:charge, :string)

    field(:payment_method_details, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.CardGeneratedFromPaymentMethodDetails]
    )

    field(:setup_attempt, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.SetupAttempt]
    )
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:setup_attempt, :payment_method_details, :charge])
  end
end