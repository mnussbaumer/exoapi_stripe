defmodule ExOAPI.Stripe.Schemas.PortalSubscriptionCancellationReason do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:enabled** :: *:boolean*

  Whether the feature is enabled.


  **::options** :: *:string*


  """

  @primary_key false
  typed_embedded_schema do
    field(:enabled, :boolean)

    field(:options, {:array, :string})
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:options, :enabled])
    |> validate_required([:enabled])
  end
end