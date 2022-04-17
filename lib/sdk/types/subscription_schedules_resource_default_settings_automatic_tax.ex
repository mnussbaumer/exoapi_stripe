defmodule ExOAPI.Stripe.Schemas.SubscriptionSchedulesResourceDefaultSettingsAutomaticTax do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:enabled** :: *:boolean*

  Whether Stripe automatically computes tax on invoices created during this phase.


  """

  @primary_key false
  typed_embedded_schema do
    field(:enabled, :boolean)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:enabled])
    |> validate_required([:enabled])
  end
end