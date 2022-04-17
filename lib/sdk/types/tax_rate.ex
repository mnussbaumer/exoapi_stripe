defmodule ExOAPI.Stripe.Schemas.TaxRate do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: Tax rates can be applied to [invoices](https://stripe.com/docs/billing/invoices/tax-rates), [subscriptions](https://stripe.com/docs/billing/subscriptions/taxes) and [Checkout Sessions](https://stripe.com/docs/payments/checkout/set-up-a-subscription#tax-rates) to collect tax.

  Related guide: [Tax Rates](https://stripe.com/docs/billing/taxes/tax-rates).

  **:active** :: *:boolean*

  Defaults to `true`. When set to `false`, this tax rate cannot be used with new applications or Checkout Sessions, but will still work for subscriptions and invoices that already have it set.


  **:country** :: *:string*

  Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)).


  **:created** :: *:integer*

  Time at which the object was created. Measured in seconds since the Unix epoch.


  **:description** :: *:string*

  An arbitrary string attached to the tax rate for your internal use only. It will not be visible to your customers.


  **:display_name** :: *:string*

  The display name of the tax rates as it will appear to your customer on their receipt email, PDF, and the hosted invoice page.


  **:id** :: *:string*

  Unique identifier for the object.


  **:inclusive** :: *:boolean*

  This specifies if the tax rate is inclusive or exclusive.


  **:jurisdiction** :: *:string*

  The jurisdiction for the tax rate. You can use this label field for tax reporting purposes. It also appears on your customer’s invoice.


  **:livemode** :: *:boolean*

  Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.


  **:metadata** :: *:map*

  Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  **:percentage** :: *:number*

  This represents the tax rate percent out of 100.


  **:state** :: *:string*

  [ISO 3166-2 subdivision code](https://en.wikipedia.org/wiki/ISO_3166-2:US), without country prefix. For example, "NY" for New York, United States.


  **:tax_type** :: *:string*

  The high-level tax type, such as `vat` or `sales_tax`.


  """

  @primary_key false
  typed_embedded_schema do
    field(:active, :boolean)

    field(:country, :string)

    field(:created, :integer)

    field(:description, :string)

    field(:display_name, :string)

    field(:id, :string)

    field(:inclusive, :boolean)

    field(:jurisdiction, :string)

    field(:livemode, :boolean)

    field(:metadata, :map)

    field(:object, Ecto.Enum, values: [:tax_rate])

    field(:percentage, :float)

    field(:state, :string)

    field(:tax_type, Ecto.Enum, values: [:vat, :sales_tax, :rst, :qst, :pst, :jct, :hst, :gst])
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :tax_type,
      :state,
      :percentage,
      :object,
      :metadata,
      :livemode,
      :jurisdiction,
      :inclusive,
      :id,
      :display_name,
      :description,
      :created,
      :country,
      :active
    ])
    |> validate_required([
      :percentage,
      :object,
      :livemode,
      :inclusive,
      :id,
      :display_name,
      :created,
      :active
    ])
  end
end