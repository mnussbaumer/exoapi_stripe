defmodule ExOAPI.Stripe.Schemas.PaymentPagesCheckoutSessionAfterExpiration do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:recovery** :: *ExOAPI.Stripe.Schemas.PaymentPagesCheckoutSessionAfterExpirationRecovery*

  When set, configuration used to recover the Checkout Session on expiry.


  """

  @primary_key false
  typed_embedded_schema do
    field(:recovery, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.PaymentPagesCheckoutSessionAfterExpirationRecovery]
    )
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:recovery])
  end
end