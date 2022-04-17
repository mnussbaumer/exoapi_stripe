defmodule ExOAPI.Stripe.Schemas.BalanceDetail do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **::available** :: *ExOAPI.Stripe.Schemas.BalanceAmount*


  """

  @primary_key false
  typed_embedded_schema do
    embeds_many(:available, ExOAPI.Stripe.Schemas.BalanceAmount)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [])
    |> cast_embed(:available, required: true)
  end
end