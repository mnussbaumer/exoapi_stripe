defmodule ExOAPI.Stripe.Schemas.SetupAttemptPaymentMethodDetailsCardPresent do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:generated_card** :: *ExOAPI.Stripe.Schemas.PaymentMethod | :string*

  The ID of the Card PaymentMethod which was generated by this SetupAttempt.


  """

  @primary_key false
  typed_embedded_schema do
    field(:generated_card, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.PaymentMethod]
    )
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:generated_card])
  end
end