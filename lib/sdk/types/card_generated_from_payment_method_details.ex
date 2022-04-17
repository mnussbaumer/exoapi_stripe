defmodule ExOAPI.Stripe.Schemas.CardGeneratedFromPaymentMethodDetails do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:card_present** :: *ExOAPI.Stripe.Schemas.PaymentMethodDetailsCardPresent*


  **:type** :: *:string*

  The type of payment method transaction-specific details from the transaction that generated this `card` payment method. Always `card_present`.


  """

  @primary_key false
  typed_embedded_schema do
    embeds_one(:card_present, ExOAPI.Stripe.Schemas.PaymentMethodDetailsCardPresent)

    field(:type, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:type])
    |> validate_required([:type])
    |> cast_embed(:card_present)
  end
end