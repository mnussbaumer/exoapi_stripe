defmodule ExOAPI.Stripe.Schemas.PaymentMethodDetailsCardInstallments do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:plan** :: *ExOAPI.Stripe.Schemas.PaymentMethodDetailsCardInstallmentsPlan*

  Installment plan selected for the payment.


  """

  @primary_key false
  typed_embedded_schema do
    field(:plan, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.PaymentMethodDetailsCardInstallmentsPlan]
    )
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:plan])
  end
end