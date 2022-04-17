defmodule ExOAPI.Stripe.Schemas.Quote do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: A Quote is a way to model prices that you'd like to provide to a customer.
  Once accepted, it will automatically create an invoice, subscription or subscription schedule.

  **:application_fee_percent** :: *:number*

  A non-negative decimal between 0 and 100, with at most two decimal places. This represents the percentage of the subscription invoice subtotal that will be transferred to the application owner's Stripe account. Only applicable if there are line items with recurring prices on the quote.


  **:computed** :: *ExOAPI.Stripe.Schemas.QuotesResourceComputed*


  **:livemode** :: *:boolean*

  Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.


  **:collection_method** :: *:string*

  Either `charge_automatically`, or `send_invoice`. When charging automatically, Stripe will attempt to pay invoices at the end of the subscription cycle or on finalization using the default payment method attached to the subscription or customer. When sending an invoice, Stripe will email your customer an invoice with payment instructions. Defaults to `charge_automatically`.


  **::data** :: *ExOAPI.Stripe.Schemas.Item*


  **:has_more** :: *:boolean*

  True if this list has another page of items after this one that can be fetched.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value. Always has the value `list`.


  **:url** :: *:string*

  The URL where this list can be accessed.


  **:metadata** :: *:map*

  Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.


  **:subscription_data** :: *ExOAPI.Stripe.Schemas.QuotesResourceSubscriptionData*


  **:description** :: *:string*

  A description that will be displayed on the quote PDF.


  **:footer** :: *:string*

  A footer that will be displayed on the quote PDF.


  **:header** :: *:string*

  A header that will be displayed on the quote PDF.


  **:subscription_schedule** :: *ExOAPI.Stripe.Schemas.SubscriptionSchedule | :string*

  The subscription schedule that was created or updated from this quote.


  **:on_behalf_of** :: *ExOAPI.Stripe.Schemas.Account | :string*

  The account on behalf of which to charge. See the [Connect documentation](https://support.stripe.com/questions/sending-invoices-on-behalf-of-connected-accounts) for details.


  **:customer** :: *ExOAPI.Stripe.Schemas.DeletedCustomer | ExOAPI.Stripe.Schemas.Customer | :string*

  The customer which this quote belongs to. A customer is required before finalizing the quote. Once specified, it cannot be changed.


  **:invoice** :: *ExOAPI.Stripe.Schemas.DeletedInvoice | ExOAPI.Stripe.Schemas.Invoice | :string*

  The invoice that was created from this quote.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  **:invoice_settings** :: *ExOAPI.Stripe.Schemas.InvoiceSettingQuoteSetting*

  All invoices will be billed using the specified settings.


  **:total_details** :: *ExOAPI.Stripe.Schemas.QuotesResourceTotalDetails*


  **:expires_at** :: *:integer*

  The date on which the quote will be canceled if in `open` or `draft` status. Measured in seconds since the Unix epoch.


  **:status_transitions** :: *ExOAPI.Stripe.Schemas.QuotesResourceStatusTransitions*


  **:test_clock** :: *ExOAPI.Stripe.Schemas.TestHelpers_testClock | :string*

  ID of the test clock this quote belongs to.


  **:automatic_tax** :: *ExOAPI.Stripe.Schemas.QuotesResourceAutomaticTax*


  **:currency** :: *:string*

  Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).


  **:created** :: *:integer*

  Time at which the object was created. Measured in seconds since the Unix epoch.


  **::discounts** :: *ExOAPI.Stripe.Schemas.Discount | :string*


  **:amount_subtotal** :: *:integer*

  Total before any discounts or taxes are applied.


  **:amount_total** :: *:integer*

  Total after discounts and taxes are applied.


  **:subscription** :: *ExOAPI.Stripe.Schemas.Subscription | :string*

  The subscription that was created or updated from this quote.


  **:status** :: *:string*

  The status of the quote.


  **:from_quote** :: *ExOAPI.Stripe.Schemas.QuotesResourceFromQuote*

  Details of the quote that was cloned. See the [cloning documentation](https://stripe.com/docs/quotes/clone) for more details.


  **:number** :: *:string*

  A unique number that identifies this particular quote. This number is assigned once the quote is [finalized](https://stripe.com/docs/quotes/overview#finalize).


  **:application_fee_amount** :: *:integer*

  The amount of the application fee (if any) that will be requested to be applied to the payment and transferred to the application owner's Stripe account. Only applicable if there are no line items with recurring prices on the quote.


  **:transfer_data** :: *ExOAPI.Stripe.Schemas.QuotesResourceTransferData*

  The account (if any) the payments will be attributed to for tax reporting, and where funds from each payment will be transferred to for each of the invoices.


  **:id** :: *:string*

  Unique identifier for the object.


  **::default_tax_rates** :: *ExOAPI.Stripe.Schemas.TaxRate | :string*


  """

  @primary_key false
  typed_embedded_schema do
    field(:application_fee_percent, :float)

    embeds_one(:computed, ExOAPI.Stripe.Schemas.QuotesResourceComputed)

    field(:livemode, :boolean)

    field(:collection_method, Ecto.Enum, values: [:send_invoice, :charge_automatically])

    field(:line_items, :map)

    field(:metadata, :map)

    embeds_one(:subscription_data, ExOAPI.Stripe.Schemas.QuotesResourceSubscriptionData)

    field(:description, :string)

    field(:footer, :string)

    field(:header, :string)

    field(:subscription_schedule, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.SubscriptionSchedule]
    )

    field(:on_behalf_of, ExOAPI.EctoTypes.AnyOf, types: [:string, ExOAPI.Stripe.Schemas.Account])

    field(:customer, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.Customer, ExOAPI.Stripe.Schemas.DeletedCustomer]
    )

    field(:invoice, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.Invoice, ExOAPI.Stripe.Schemas.DeletedInvoice]
    )

    field(:object, Ecto.Enum, values: [:quote])

    field(:invoice_settings, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.InvoiceSettingQuoteSetting]
    )

    embeds_one(:total_details, ExOAPI.Stripe.Schemas.QuotesResourceTotalDetails)

    field(:expires_at, :integer)

    embeds_one(:status_transitions, ExOAPI.Stripe.Schemas.QuotesResourceStatusTransitions)

    field(:test_clock, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.TestHelpers_testClock]
    )

    embeds_one(:automatic_tax, ExOAPI.Stripe.Schemas.QuotesResourceAutomaticTax)

    field(:currency, :string)

    field(:created, :integer)

    field(:discounts, {:array, ExOAPI.EctoTypes.AnyOf},
      types: [ExOAPI.Stripe.Schemas.Discount, :string]
    )

    field(:amount_subtotal, :integer)

    field(:amount_total, :integer)

    field(:subscription, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.Subscription]
    )

    field(:status, Ecto.Enum, values: [:open, :draft, :canceled, :accepted])

    field(:from_quote, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.QuotesResourceFromQuote]
    )

    field(:number, :string)

    field(:application_fee_amount, :integer)

    field(:transfer_data, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.QuotesResourceTransferData]
    )

    field(:id, :string)

    field(:default_tax_rates, {:array, ExOAPI.EctoTypes.AnyOf},
      types: [ExOAPI.Stripe.Schemas.TaxRate, :string]
    )
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :default_tax_rates,
      :id,
      :transfer_data,
      :application_fee_amount,
      :number,
      :from_quote,
      :status,
      :subscription,
      :amount_total,
      :amount_subtotal,
      :discounts,
      :created,
      :currency,
      :test_clock,
      :expires_at,
      :invoice_settings,
      :object,
      :invoice,
      :customer,
      :on_behalf_of,
      :subscription_schedule,
      :header,
      :footer,
      :description,
      :metadata,
      :line_items,
      :collection_method,
      :livemode,
      :application_fee_percent
    ])
    |> validate_required([
      :id,
      :status,
      :amount_total,
      :amount_subtotal,
      :discounts,
      :created,
      :expires_at,
      :object,
      :metadata,
      :collection_method,
      :livemode
    ])
    |> cast_embed(:automatic_tax, required: true)
    |> cast_embed(:status_transitions, required: true)
    |> cast_embed(:total_details, required: true)
    |> cast_embed(:subscription_data, required: true)
    |> cast_embed(:computed, required: true)
  end
end