defmodule ExOAPI.Stripe.Schemas.PaymentMethodKlarna do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:dob** :: *ExOAPI.Stripe.Schemas.PaymentFlowsPrivatePaymentMethodsKlarnaDob*

  The customer's date of birth, if provided.


  """

  @primary_key false
  typed_embedded_schema do
    field(:dob, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.PaymentFlowsPrivatePaymentMethodsKlarnaDob]
    )
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:dob])
  end
end