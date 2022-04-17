defmodule ExOAPI.Stripe.Schemas.LegalEntityCompanyVerification do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:document** :: *ExOAPI.Stripe.Schemas.LegalEntityCompanyVerificationDocument*


  """

  @primary_key false
  typed_embedded_schema do
    embeds_one(:document, ExOAPI.Stripe.Schemas.LegalEntityCompanyVerificationDocument)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [])
    |> cast_embed(:document, required: true)
  end
end