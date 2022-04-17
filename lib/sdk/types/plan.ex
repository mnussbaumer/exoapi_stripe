defmodule ExOAPI.Stripe.Schemas.Plan do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: You can now model subscriptions more flexibly using the [Prices API](https://stripe.com/docs/api#prices). It replaces the Plans API and is backwards compatible to simplify your migration.

  Plans define the base price, currency, and billing cycle for recurring purchases of products.
  [Products](https://stripe.com/docs/api#products) help you track inventory or provisioning, and plans help you track pricing. Different physical goods or levels of service should be represented by products, and pricing options should be represented by plans. This approach lets you change prices without having to change your provisioning scheme.

  For example, you might have a single "gold" product that has plans for $10/month, $100/year, €9/month, and €90/year.

  Related guides: [Set up a subscription](https://stripe.com/docs/billing/subscriptions/set-up-subscription) and more about [products and prices](https://stripe.com/docs/products-prices/overview).

  **:active** :: *:boolean*

  Whether the plan can be used for new purchases.


  **:aggregate_usage** :: *:string*

  Specifies a usage aggregation strategy for plans of `usage_type=metered`. Allowed values are `sum` for summing up all usage during a period, `last_during_period` for using the last usage record reported within a period, `last_ever` for using the last usage record ever (across period bounds) or `max` which uses the usage record with the maximum reported usage during a period. Defaults to `sum`.


  **:amount** :: *:integer*

  The unit amount in %s to be charged, represented as a whole integer if possible. Only set if `billing_scheme=per_unit`.


  **:amount_decimal** :: *:string*

  The unit amount in %s to be charged, represented as a decimal string with at most 12 decimal places. Only set if `billing_scheme=per_unit`.


  **:billing_scheme** :: *:string*

  Describes how to compute the price per period. Either `per_unit` or `tiered`. `per_unit` indicates that the fixed amount (specified in `amount`) will be charged per unit in `quantity` (for plans with `usage_type=licensed`), or per unit of total usage (for plans with `usage_type=metered`). `tiered` indicates that the unit pricing will be computed using a tiering strategy as defined using the `tiers` and `tiers_mode` attributes.


  **:created** :: *:integer*

  Time at which the object was created. Measured in seconds since the Unix epoch.


  **:currency** :: *:string*

  Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).


  **:id** :: *:string*

  Unique identifier for the object.


  **:interval** :: *:string*

  The frequency at which a subscription is billed. One of `day`, `week`, `month` or `year`.


  **:interval_count** :: *:integer*

  The number of intervals (specified in the `interval` attribute) between subscription billings. For example, `interval=month` and `interval_count=3` bills every 3 months.


  **:livemode** :: *:boolean*

  Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.


  **:metadata** :: *:map*

  Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.


  **:nickname** :: *:string*

  A brief description of the plan, hidden from customers.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  **:product** :: *ExOAPI.Stripe.Schemas.DeletedProduct | ExOAPI.Stripe.Schemas.Product | :string*

  The product whose pricing this plan determines.


  **::tiers** :: *ExOAPI.Stripe.Schemas.PlanTier*


  **:tiers_mode** :: *:string*

  Defines if the tiering price should be `graduated` or `volume` based. In `volume`-based tiering, the maximum quantity within a period determines the per unit price. In `graduated` tiering, pricing can change as the quantity grows.


  **:transform_usage** :: *ExOAPI.Stripe.Schemas.TransformUsage*

  Apply a transformation to the reported usage or set quantity before computing the amount billed. Cannot be combined with `tiers`.


  **:trial_period_days** :: *:integer*

  Default number of trial days when subscribing a customer to this plan using [`trial_from_plan=true`](https://stripe.com/docs/api#create_subscription-trial_from_plan).


  **:usage_type** :: *:string*

  Configures how the quantity per period should be determined. Can be either `metered` or `licensed`. `licensed` automatically bills the `quantity` set when adding it to a subscription. `metered` aggregates the total usage based on usage records. Defaults to `licensed`.


  """

  @primary_key false
  typed_embedded_schema do
    field(:active, :boolean)

    field(:aggregate_usage, Ecto.Enum, values: [:sum, :max, :last_ever, :last_during_period])

    field(:amount, :integer)

    field(:amount_decimal, :string)

    field(:billing_scheme, Ecto.Enum, values: [:tiered, :per_unit])

    field(:created, :integer)

    field(:currency, :string)

    field(:id, :string)

    field(:interval, Ecto.Enum, values: [:year, :week, :month, :day])

    field(:interval_count, :integer)

    field(:livemode, :boolean)

    field(:metadata, :map)

    field(:nickname, :string)

    field(:object, Ecto.Enum, values: [:plan])

    field(:product, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.Product, ExOAPI.Stripe.Schemas.DeletedProduct]
    )

    embeds_many(:tiers, ExOAPI.Stripe.Schemas.PlanTier)

    field(:tiers_mode, Ecto.Enum, values: [:volume, :graduated])

    field(:transform_usage, ExOAPI.EctoTypes.AnyOf, types: [ExOAPI.Stripe.Schemas.TransformUsage])

    field(:trial_period_days, :integer)

    field(:usage_type, Ecto.Enum, values: [:metered, :licensed])
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :usage_type,
      :trial_period_days,
      :transform_usage,
      :tiers_mode,
      :product,
      :object,
      :nickname,
      :metadata,
      :livemode,
      :interval_count,
      :interval,
      :id,
      :currency,
      :created,
      :billing_scheme,
      :amount_decimal,
      :amount,
      :aggregate_usage,
      :active
    ])
    |> validate_required([
      :usage_type,
      :object,
      :livemode,
      :interval_count,
      :interval,
      :id,
      :currency,
      :created,
      :billing_scheme,
      :active
    ])
    |> cast_embed(:tiers)
  end
end