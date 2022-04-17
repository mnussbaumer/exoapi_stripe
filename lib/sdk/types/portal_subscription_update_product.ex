defmodule ExOAPI.Stripe.Schemas.PortalSubscriptionUpdateProduct do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **::prices** :: *:string*


  **:product** :: *ExOAPI.Stripe.Schemas.Product*

  The product ID.


  """

  @primary_key false
  typed_embedded_schema do
    field(:prices, {:array, :string})

    field(:product, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:product, :prices])
    |> validate_required([:product])
  end
end