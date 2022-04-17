defmodule ExOAPI.Stripe.Schemas.TransformQuantity do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:divide_by** :: *:integer*

  Divide usage by this number.


  **:round** :: *:string*

  After division, either round the result `up` or `down`.


  """

  @primary_key false
  typed_embedded_schema do
    field(:divide_by, :integer)

    field(:round, Ecto.Enum, values: [:up, :down])
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:round, :divide_by])
    |> validate_required([:round, :divide_by])
  end
end