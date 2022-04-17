defmodule ExOAPI.Stripe.Schemas.SubscriptionItem do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: Subscription items allow you to create customer subscriptions with more than
  one plan, making it easy to represent complex billing relationships.

  **:billing_thresholds** :: *ExOAPI.Stripe.Schemas.SubscriptionItemBillingThresholds*

  Define thresholds at which an invoice will be sent, and the related subscription advanced to a new billing period


  **:created** :: *:integer*

  Time at which the object was created. Measured in seconds since the Unix epoch.


  **:id** :: *:string*

  Unique identifier for the object.


  **:metadata** :: *:map*

  Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  **:price** :: *ExOAPI.Stripe.Schemas.Price*


  **:quantity** :: *:integer*

  The [quantity](https://stripe.com/docs/subscriptions/quantities) of the plan to which the customer should be subscribed.


  **:subscription** :: *ExOAPI.Stripe.Schemas.Subscription*

  The `subscription` this `subscription_item` belongs to.


  **::tax_rates** :: *ExOAPI.Stripe.Schemas.TaxRate*


  """

  @primary_key false
  typed_embedded_schema do
    field(:billing_thresholds, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.SubscriptionItemBillingThresholds]
    )

    field(:created, :integer)

    field(:id, :string)

    field(:metadata, :map)

    field(:object, Ecto.Enum, values: [:subscription_item])

    embeds_one(:price, ExOAPI.Stripe.Schemas.Price)

    field(:quantity, :integer)

    field(:subscription, :string)

    embeds_many(:tax_rates, ExOAPI.Stripe.Schemas.TaxRate)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :subscription,
      :quantity,
      :object,
      :metadata,
      :id,
      :created,
      :billing_thresholds
    ])
    |> validate_required([:subscription, :object, :metadata, :id, :created])
    |> cast_embed(:tax_rates)
    |> cast_embed(:price, required: true)
  end
end