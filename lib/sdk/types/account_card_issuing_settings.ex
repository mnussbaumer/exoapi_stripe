defmodule ExOAPI.Stripe.Schemas.AccountCardIssuingSettings do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:tos_acceptance** :: *ExOAPI.Stripe.Schemas.CardIssuingAccountTermsOfService*


  """

  @primary_key false
  typed_embedded_schema do
    embeds_one(:tos_acceptance, ExOAPI.Stripe.Schemas.CardIssuingAccountTermsOfService)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [])
    |> cast_embed(:tos_acceptance)
  end
end