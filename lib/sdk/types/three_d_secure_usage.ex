defmodule ExOAPI.Stripe.Schemas.ThreeDSecureUsage do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:supported** :: *:boolean*

  Whether 3D Secure is supported on this card.


  """

  @primary_key false
  typed_embedded_schema do
    field(:supported, :boolean)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:supported])
    |> validate_required([:supported])
  end
end