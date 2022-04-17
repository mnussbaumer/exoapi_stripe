defmodule ExOAPI.Stripe.Schemas.IssuingTransactionPurchaseDetails do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:flight** :: *ExOAPI.Stripe.Schemas.IssuingTransactionFlightData*

  Information about the flight that was purchased with this transaction.


  **:fuel** :: *ExOAPI.Stripe.Schemas.IssuingTransactionFuelData*

  Information about fuel that was purchased with this transaction.


  **:lodging** :: *ExOAPI.Stripe.Schemas.IssuingTransactionLodgingData*

  Information about lodging that was purchased with this transaction.


  **::receipt** :: *ExOAPI.Stripe.Schemas.IssuingTransactionReceiptData*


  **:reference** :: *:string*

  A merchant-specific order number.


  """

  @primary_key false
  typed_embedded_schema do
    field(:flight, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.IssuingTransactionFlightData]
    )

    field(:fuel, ExOAPI.EctoTypes.AnyOf, types: [ExOAPI.Stripe.Schemas.IssuingTransactionFuelData])

    field(:lodging, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.IssuingTransactionLodgingData]
    )

    embeds_many(:receipt, ExOAPI.Stripe.Schemas.IssuingTransactionReceiptData)

    field(:reference, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:reference, :lodging, :fuel, :flight])
    |> cast_embed(:receipt)
  end
end