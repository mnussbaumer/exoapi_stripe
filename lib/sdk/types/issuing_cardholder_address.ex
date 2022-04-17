defmodule ExOAPI.Stripe.Schemas.IssuingCardholderAddress do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:address** :: *ExOAPI.Stripe.Schemas.Address*


  """

  @primary_key false
  typed_embedded_schema do
    embeds_one(:address, ExOAPI.Stripe.Schemas.Address)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [])
    |> cast_embed(:address, required: true)
  end
end