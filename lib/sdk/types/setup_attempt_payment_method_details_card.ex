defmodule ExOAPI.Stripe.Schemas.SetupAttemptPaymentMethodDetailsCard do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:three_d_secure** :: *ExOAPI.Stripe.Schemas.ThreeDSecureDetails*

  Populated if this authorization used 3D Secure authentication.


  """

  @primary_key false
  typed_embedded_schema do
    field(:three_d_secure, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.ThreeDSecureDetails]
    )
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:three_d_secure])
  end
end