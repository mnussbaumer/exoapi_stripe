defmodule ExOAPI.Stripe.Schemas.SepaDebitGeneratedFrom do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:charge** :: *ExOAPI.Stripe.Schemas.Charge | :string*

  The ID of the Charge that generated this PaymentMethod, if any.


  **:setup_attempt** :: *ExOAPI.Stripe.Schemas.SetupAttempt | :string*

  The ID of the SetupAttempt that generated this PaymentMethod, if any.


  """

  @primary_key false
  typed_embedded_schema do
    field(:charge, ExOAPI.EctoTypes.AnyOf, types: [:string, ExOAPI.Stripe.Schemas.Charge])

    field(:setup_attempt, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.SetupAttempt]
    )
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:setup_attempt, :charge])
  end
end