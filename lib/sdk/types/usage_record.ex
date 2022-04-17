defmodule ExOAPI.Stripe.Schemas.UsageRecord do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: Usage records allow you to report customer usage and metrics to Stripe for
  metered billing of subscription prices.

  Related guide: [Metered Billing](https://stripe.com/docs/billing/subscriptions/metered-billing).

  **:id** :: *:string*

  Unique identifier for the object.


  **:livemode** :: *:boolean*

  Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  **:quantity** :: *:integer*

  The usage quantity for the specified date.


  **:subscription_item** :: *ExOAPI.Stripe.Schemas.SubscriptionItem*

  The ID of the subscription item this usage record contains data for.


  **:timestamp** :: *:integer*

  The timestamp when this usage occurred.


  """

  @primary_key false
  typed_embedded_schema do
    field(:id, :string)

    field(:livemode, :boolean)

    field(:object, Ecto.Enum, values: [:usage_record])

    field(:quantity, :integer)

    field(:subscription_item, :string)

    field(:timestamp, :integer)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:timestamp, :subscription_item, :quantity, :object, :livemode, :id])
    |> validate_required([:timestamp, :subscription_item, :quantity, :object, :livemode, :id])
  end
end