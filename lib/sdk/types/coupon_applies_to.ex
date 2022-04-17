defmodule ExOAPI.Stripe.Schemas.CouponAppliesTo do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **::products** :: *:string*


  """

  @primary_key false
  typed_embedded_schema do
    field(:products, {:array, :string})
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:products])
  end
end