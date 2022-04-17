defmodule ExOAPI.Stripe.Schemas.SourceTypeEps do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:reference** :: *:string*


  **:statement_descriptor** :: *:string*


  """

  @primary_key false
  typed_embedded_schema do
    field(:reference, :string)

    field(:statement_descriptor, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:statement_descriptor, :reference])
  end
end