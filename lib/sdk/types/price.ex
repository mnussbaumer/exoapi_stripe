defmodule ExOAPI.Stripe.Schemas.Price do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: Prices define the unit cost, currency, and (optional) billing cycle for both recurring and one-time purchases of products.
  [Products](https://stripe.com/docs/api#products) help you track inventory or provisioning, and prices help you track payment terms. Different physical goods or levels of service should be represented by products, and pricing options should be represented by prices. This approach lets you change prices without having to change your provisioning scheme.

  For example, you might have a single "gold" product that has prices for $10/month, $100/year, and €9 once.

  Related guides: [Set up a subscription](https://stripe.com/docs/billing/subscriptions/set-up-subscription), [create an invoice](https://stripe.com/docs/billing/invoices/create), and more about [products and prices](https://stripe.com/docs/products-prices/overview).

  **:active** :: *:boolean*

  Whether the price can be used for new purchases.


  **:billing_scheme** :: *:string*

  Describes how to compute the price per period. Either `per_unit` or `tiered`. `per_unit` indicates that the fixed amount (specified in `unit_amount` or `unit_amount_decimal`) will be charged per unit in `quantity` (for prices with `usage_type=licensed`), or per unit of total usage (for prices with `usage_type=metered`). `tiered` indicates that the unit pricing will be computed using a tiering strategy as defined using the `tiers` and `tiers_mode` attributes.


  **:created** :: *:integer*

  Time at which the object was created. Measured in seconds since the Unix epoch.


  **:currency** :: *:string*

  Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).


  **:id** :: *:string*

  Unique identifier for the object.


  **:livemode** :: *:boolean*

  Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.


  **:lookup_key** :: *:string*

  A lookup key used to retrieve prices dynamically from a static string. This may be up to 200 characters.


  **:metadata** :: *:map*

  Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.


  **:nickname** :: *:string*

  A brief description of the price, hidden from customers.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  **:product** :: *ExOAPI.Stripe.Schemas.DeletedProduct | ExOAPI.Stripe.Schemas.Product | :string*

  The ID of the product this price is associated with.


  **:recurring** :: *ExOAPI.Stripe.Schemas.Recurring*

  The recurring components of a price such as `interval` and `usage_type`.


  **:tax_behavior** :: *:string*

  Specifies whether the price is considered inclusive of taxes or exclusive of taxes. One of `inclusive`, `exclusive`, or `unspecified`. Once specified as either `inclusive` or `exclusive`, it cannot be changed.


  **::tiers** :: *ExOAPI.Stripe.Schemas.PriceTier*


  **:tiers_mode** :: *:string*

  Defines if the tiering price should be `graduated` or `volume` based. In `volume`-based tiering, the maximum quantity within a period determines the per unit price. In `graduated` tiering, pricing can change as the quantity grows.


  **:transform_quantity** :: *ExOAPI.Stripe.Schemas.TransformQuantity*

  Apply a transformation to the reported usage or set quantity before computing the amount billed. Cannot be combined with `tiers`.


  **:type** :: *:string*

  One of `one_time` or `recurring` depending on whether the price is for a one-time purchase or a recurring (subscription) purchase.


  **:unit_amount** :: *:integer*

  The unit amount in %s to be charged, represented as a whole integer if possible. Only set if `billing_scheme=per_unit`.


  **:unit_amount_decimal** :: *:string*

  The unit amount in %s to be charged, represented as a decimal string with at most 12 decimal places. Only set if `billing_scheme=per_unit`.


  """

  @primary_key false
  typed_embedded_schema do
    field(:active, :boolean)

    field(:billing_scheme, Ecto.Enum, values: [:tiered, :per_unit])

    field(:created, :integer)

    field(:currency, :string)

    field(:id, :string)

    field(:livemode, :boolean)

    field(:lookup_key, :string)

    field(:metadata, :map)

    field(:nickname, :string)

    field(:object, Ecto.Enum, values: [:price])

    field(:product, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.Product, ExOAPI.Stripe.Schemas.DeletedProduct]
    )

    field(:recurring, ExOAPI.EctoTypes.AnyOf, types: [ExOAPI.Stripe.Schemas.Recurring])

    field(:tax_behavior, Ecto.Enum, values: [:unspecified, :inclusive, :exclusive])

    embeds_many(:tiers, ExOAPI.Stripe.Schemas.PriceTier)

    field(:tiers_mode, Ecto.Enum, values: [:volume, :graduated])

    field(:transform_quantity, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.TransformQuantity]
    )

    field(:type, Ecto.Enum, values: [:recurring, :one_time])

    field(:unit_amount, :integer)

    field(:unit_amount_decimal, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :unit_amount_decimal,
      :unit_amount,
      :type,
      :transform_quantity,
      :tiers_mode,
      :tax_behavior,
      :recurring,
      :product,
      :object,
      :nickname,
      :metadata,
      :lookup_key,
      :livemode,
      :id,
      :currency,
      :created,
      :billing_scheme,
      :active
    ])
    |> validate_required([
      :type,
      :product,
      :object,
      :metadata,
      :livemode,
      :id,
      :currency,
      :created,
      :billing_scheme,
      :active
    ])
    |> cast_embed(:tiers)
  end
end