defmodule ExOAPI.Stripe.Schemas.IssuingCardholderVerification do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:document** :: *ExOAPI.Stripe.Schemas.IssuingCardholderIdDocument*

  An identifying document, either a passport or local ID card.


  """

  @primary_key false
  typed_embedded_schema do
    field(:document, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.IssuingCardholderIdDocument]
    )
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:document])
  end
end