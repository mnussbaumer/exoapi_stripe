defmodule ExOAPI.Stripe.Schemas.PortalCustomerUpdate do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **::allowed_updates** :: *:string*


  **:enabled** :: *:boolean*

  Whether the feature is enabled.


  """

  @primary_key false
  typed_embedded_schema do
    field(:allowed_updates, {:array, :string})

    field(:enabled, :boolean)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:enabled, :allowed_updates])
    |> validate_required([:enabled])
  end
end