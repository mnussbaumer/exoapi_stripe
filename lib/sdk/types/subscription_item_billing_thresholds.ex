defmodule ExOAPI.Stripe.Schemas.SubscriptionItemBillingThresholds do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:usage_gte** :: *:integer*

  Usage threshold that triggers the subscription to create an invoice


  """

  @primary_key false
  typed_embedded_schema do
    field(:usage_gte, :integer)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:usage_gte])
  end
end