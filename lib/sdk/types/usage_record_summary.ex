defmodule ExOAPI.Stripe.Schemas.UsageRecordSummary do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:id** :: *:string*

  Unique identifier for the object.


  **:invoice** :: *ExOAPI.Stripe.Schemas.Invoice*

  The invoice in which this usage period has been billed for.


  **:livemode** :: *:boolean*

  Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  **:period** :: *ExOAPI.Stripe.Schemas.Period*


  **:subscription_item** :: *ExOAPI.Stripe.Schemas.SubscriptionItem*

  The ID of the subscription item this summary is describing.


  **:total_usage** :: *:integer*

  The total usage within this usage period.


  """

  @primary_key false
  typed_embedded_schema do
    field(:id, :string)

    field(:invoice, :string)

    field(:livemode, :boolean)

    field(:object, Ecto.Enum, values: [:usage_record_summary])

    embeds_one(:period, ExOAPI.Stripe.Schemas.Period)

    field(:subscription_item, :string)

    field(:total_usage, :integer)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:total_usage, :subscription_item, :object, :livemode, :invoice, :id])
    |> validate_required([:total_usage, :subscription_item, :object, :livemode, :id])
    |> cast_embed(:period, required: true)
  end
end