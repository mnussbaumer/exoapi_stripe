defmodule ExOAPI.Stripe.Schemas.Networks do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **::available** :: *:string*


  **:preferred** :: *:string*

  The preferred network for the card.


  """

  @primary_key false
  typed_embedded_schema do
    field(:available, {:array, :string})

    field(:preferred, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:preferred, :available])
  end
end