defmodule ExOAPI.Stripe.Schemas.ShippingRateDeliveryEstimate do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:maximum** :: *ExOAPI.Stripe.Schemas.ShippingRateDeliveryEstimateBound*

  The upper bound of the estimated range. If empty, represents no upper bound i.e., infinite.


  **:minimum** :: *ExOAPI.Stripe.Schemas.ShippingRateDeliveryEstimateBound*

  The lower bound of the estimated range. If empty, represents no lower bound.


  """

  @primary_key false
  typed_embedded_schema do
    field(:maximum, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.ShippingRateDeliveryEstimateBound]
    )

    field(:minimum, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.ShippingRateDeliveryEstimateBound]
    )
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:minimum, :maximum])
  end
end