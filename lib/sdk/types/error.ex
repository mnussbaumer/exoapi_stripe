defmodule ExOAPI.Stripe.Schemas.Error do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: An error response from the Stripe API

  **:error** :: *ExOAPI.Stripe.Schemas.ApiErrors*


  """

  @primary_key false
  typed_embedded_schema do
    embeds_one(:error, ExOAPI.Stripe.Schemas.ApiErrors)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [])
    |> cast_embed(:error, required: true)
  end
end