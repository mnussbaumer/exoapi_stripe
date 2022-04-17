defmodule ExOAPI.Stripe.Schemas.CountrySpecVerificationFields do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:company** :: *ExOAPI.Stripe.Schemas.CountrySpecVerificationFieldDetails*


  **:individual** :: *ExOAPI.Stripe.Schemas.CountrySpecVerificationFieldDetails*


  """

  @primary_key false
  typed_embedded_schema do
    embeds_one(:company, ExOAPI.Stripe.Schemas.CountrySpecVerificationFieldDetails)

    embeds_one(:individual, ExOAPI.Stripe.Schemas.CountrySpecVerificationFieldDetails)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [])
    |> cast_embed(:individual, required: true)
    |> cast_embed(:company, required: true)
  end
end