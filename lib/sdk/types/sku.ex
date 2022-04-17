defmodule ExOAPI.Stripe.Schemas.Sku do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: Stores representations of [stock keeping units](http://en.wikipedia.org/wiki/Stock_keeping_unit).
  SKUs describe specific product variations, taking into account any combination of: attributes,
  currency, and cost. For example, a product may be a T-shirt, whereas a specific SKU represents
  the `size: large`, `color: red` version of that shirt.

  Can also be used to manage inventory.

  **:active** :: *:boolean*

  Whether the SKU is available for purchase.


  **:attributes** :: *:map*

  A dictionary of attributes and values for the attributes defined by the product. If, for example, a product's attributes are `["size", "gender"]`, a valid SKU has the following dictionary of attributes: `{"size": "Medium", "gender": "Unisex"}`.


  **:created** :: *:integer*

  Time at which the object was created. Measured in seconds since the Unix epoch.


  **:currency** :: *:string*

  Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).


  **:id** :: *:string*

  Unique identifier for the object.


  **:image** :: *:string*

  The URL of an image for this SKU, meant to be displayable to the customer.


  **:inventory** :: *ExOAPI.Stripe.Schemas.SkuInventory*


  **:livemode** :: *:boolean*

  Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.


  **:metadata** :: *:map*

  Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  **:package_dimensions** :: *ExOAPI.Stripe.Schemas.PackageDimensions*

  The dimensions of this SKU for shipping purposes.


  **:price** :: *ExOAPI.Stripe.Schemas.Price*

  The cost of the item as a positive integer in the smallest currency unit (that is, 100 cents to charge $1.00, or 100 to charge ¥100, Japanese Yen being a zero-decimal currency).


  **:product** :: *ExOAPI.Stripe.Schemas.Product | :string*

  The ID of the product this SKU is associated with. The product must be currently active.


  **:updated** :: *:integer*

  Time at which the object was last updated. Measured in seconds since the Unix epoch.


  """

  @primary_key false
  typed_embedded_schema do
    field(:active, :boolean)

    field(:attributes, :map)

    field(:created, :integer)

    field(:currency, :string)

    field(:id, :string)

    field(:image, :string)

    embeds_one(:inventory, ExOAPI.Stripe.Schemas.SkuInventory)

    field(:livemode, :boolean)

    field(:metadata, :map)

    field(:object, Ecto.Enum, values: [:sku])

    field(:package_dimensions, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.PackageDimensions]
    )

    field(:price, :integer)

    field(:product, ExOAPI.EctoTypes.AnyOf, types: [:string, ExOAPI.Stripe.Schemas.Product])

    field(:updated, :integer)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :updated,
      :product,
      :price,
      :package_dimensions,
      :object,
      :metadata,
      :livemode,
      :image,
      :id,
      :currency,
      :created,
      :attributes,
      :active
    ])
    |> validate_required([
      :updated,
      :product,
      :price,
      :object,
      :metadata,
      :livemode,
      :id,
      :currency,
      :created,
      :attributes,
      :active
    ])
    |> cast_embed(:inventory, required: true)
  end
end