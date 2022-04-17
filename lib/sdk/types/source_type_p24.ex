defmodule ExOAPI.Stripe.Schemas.SourceTypeP24 do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:reference** :: *:string*


  """

  @primary_key false
  typed_embedded_schema do
    field(:reference, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:reference])
  end
end