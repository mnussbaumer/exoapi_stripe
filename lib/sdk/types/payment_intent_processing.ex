defmodule ExOAPI.Stripe.Schemas.PaymentIntentProcessing do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:card** :: *ExOAPI.Stripe.Schemas.PaymentIntentCardProcessing*


  **:type** :: *:string*

  Type of the payment method for which payment is in `processing` state, one of `card`.


  """

  @primary_key false
  typed_embedded_schema do
    embeds_one(:card, ExOAPI.Stripe.Schemas.PaymentIntentCardProcessing)

    field(:type, Ecto.Enum, values: [:card])
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:type])
    |> validate_required([:type])
    |> cast_embed(:card)
  end
end