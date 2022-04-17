defmodule ExOAPI.Stripe.Schemas.GelatoVerificationReportOptions do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:document** :: *ExOAPI.Stripe.Schemas.GelatoReportDocumentOptions*


  **:id_number** :: *list(:map)*


  """

  @primary_key false
  typed_embedded_schema do
    embeds_one(:document, ExOAPI.Stripe.Schemas.GelatoReportDocumentOptions)

    field(:id_number, {:array, :map})
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:id_number])
    |> cast_embed(:document)
  end
end