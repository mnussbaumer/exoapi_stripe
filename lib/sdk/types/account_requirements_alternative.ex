defmodule ExOAPI.Stripe.Schemas.AccountRequirementsAlternative do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **::alternative_fields_due** :: *:string*


  **::original_fields_due** :: *:string*


  """

  @primary_key false
  typed_embedded_schema do
    field(:alternative_fields_due, {:array, :string})

    field(:original_fields_due, {:array, :string})
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:original_fields_due, :alternative_fields_due])
  end
end