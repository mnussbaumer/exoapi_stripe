defmodule ExOAPI.Stripe.Schemas.GelatoReportIdNumberOptions do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @primary_key false
  typed_embedded_schema do
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [])
  end
end