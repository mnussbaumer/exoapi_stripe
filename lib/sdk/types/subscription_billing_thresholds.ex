defmodule ExOAPI.Stripe.Schemas.SubscriptionBillingThresholds do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:amount_gte** :: *:integer*

  Monetary threshold that triggers the subscription to create an invoice


  **:reset_billing_cycle_anchor** :: *:boolean*

  Indicates if the `billing_cycle_anchor` should be reset when a threshold is reached. If true, `billing_cycle_anchor` will be updated to the date/time the threshold was last reached; otherwise, the value will remain unchanged. This value may not be `true` if the subscription contains items with plans that have `aggregate_usage=last_ever`.


  """

  @primary_key false
  typed_embedded_schema do
    field(:amount_gte, :integer)

    field(:reset_billing_cycle_anchor, :boolean)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:reset_billing_cycle_anchor, :amount_gte])
  end
end