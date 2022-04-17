defmodule ExOAPI.Stripe.Schemas.TerminalReaderReaderResourceProcessPaymentIntentAction do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: Represents a reader action to process a payment intent

  **:payment_intent** :: *ExOAPI.Stripe.Schemas.PaymentIntent | :string*

  Most recent PaymentIntent processed by the reader.


  """

  @primary_key false
  typed_embedded_schema do
    field(:payment_intent, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.PaymentIntent]
    )
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:payment_intent])
    |> validate_required([:payment_intent])
  end
end