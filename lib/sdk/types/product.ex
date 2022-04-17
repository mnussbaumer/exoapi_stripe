defmodule ExOAPI.Stripe.Schemas.Product do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: Products describe the specific goods or services you offer to your customers.
  For example, you might offer a Standard and Premium version of your goods or service; each version would be a separate Product.
  They can be used in conjunction with [Prices](https://stripe.com/docs/api#prices) to configure pricing in Payment Links, Checkout, and Subscriptions.

  Related guides: [Set up a subscription](https://stripe.com/docs/billing/subscriptions/set-up-subscription),
  [share a Payment Link](https://stripe.com/docs/payments/payment-links/overview),
  [accept payments with Checkout](https://stripe.com/docs/payments/accept-a-payment#create-product-prices-upfront),
  and more about [Products and Prices](https://stripe.com/docs/products-prices/overview)

  **:active** :: *:boolean*

  Whether the product is currently available for purchase.


  **:created** :: *:integer*

  Time at which the object was created. Measured in seconds since the Unix epoch.


  **:description** :: *:string*

  The product's description, meant to be displayable to the customer. Use this field to optionally store a long form explanation of the product being sold for your own rendering purposes.


  **:id** :: *:string*

  Unique identifier for the object.


  **::images** :: *:string*


  **:livemode** :: *:boolean*

  Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.


  **:metadata** :: *:map*

  Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.


  **:name** :: *:string*

  The product's name, meant to be displayable to the customer.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  **:package_dimensions** :: *ExOAPI.Stripe.Schemas.PackageDimensions*

  The dimensions of this product for shipping purposes.


  **:shippable** :: *:boolean*

  Whether this product is shipped (i.e., physical goods).


  **:statement_descriptor** :: *:string*

  Extra information about a product which will appear on your customer's credit card statement. In the case that multiple products are billed at once, the first statement descriptor will be used.


  **:tax_code** :: *ExOAPI.Stripe.Schemas.TaxCode | :string*

  A [tax code](https://stripe.com/docs/tax/tax-codes) ID.


  **:unit_label** :: *:string*

  A label that represents units of this product in Stripe and on customers’ receipts and invoices. When set, this will be included in associated invoice line item descriptions.


  **:updated** :: *:integer*

  Time at which the object was last updated. Measured in seconds since the Unix epoch.


  **:url** :: *:string*

  A URL of a publicly-accessible webpage for this product.


  """

  @primary_key false
  typed_embedded_schema do
    field(:active, :boolean)

    field(:created, :integer)

    field(:description, :string)

    field(:id, :string)

    field(:images, {:array, :string})

    field(:livemode, :boolean)

    field(:metadata, :map)

    field(:name, :string)

    field(:object, Ecto.Enum, values: [:product])

    field(:package_dimensions, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.PackageDimensions]
    )

    field(:shippable, :boolean)

    field(:statement_descriptor, :string)

    field(:tax_code, ExOAPI.EctoTypes.AnyOf, types: [:string, ExOAPI.Stripe.Schemas.TaxCode])

    field(:unit_label, :string)

    field(:updated, :integer)

    field(:url, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :url,
      :updated,
      :unit_label,
      :tax_code,
      :statement_descriptor,
      :shippable,
      :package_dimensions,
      :object,
      :name,
      :metadata,
      :livemode,
      :images,
      :id,
      :description,
      :created,
      :active
    ])
    |> validate_required([:updated, :object, :name, :metadata, :livemode, :id, :created, :active])
  end
end