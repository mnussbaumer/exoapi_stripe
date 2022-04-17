defmodule ExOAPI.Stripe.Schemas.Invoice do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: Invoices are statements of amounts owed by a customer, and are either
  generated one-off, or generated periodically from a subscription.

  They contain [invoice items](https://stripe.com/docs/api#invoiceitems), and proration adjustments
  that may be caused by subscription upgrades/downgrades (if necessary).

  If your invoice is configured to be billed through automatic charges,
  Stripe automatically finalizes your invoice and attempts payment. Note
  that finalizing the invoice,
  [when automatic](https://stripe.com/docs/billing/invoices/workflow/#auto_advance), does
  not happen immediately as the invoice is created. Stripe waits
  until one hour after the last webhook was successfully sent (or the last
  webhook timed out after failing). If you (and the platforms you may have
  connected to) have no webhooks configured, Stripe waits one hour after
  creation to finalize the invoice.

  If your invoice is configured to be billed by sending an email, then based on your
  [email settings](https://dashboard.stripe.com/account/billing/automatic),
  Stripe will email the invoice to your customer and await payment. These
  emails can contain a link to a hosted page to pay the invoice.

  Stripe applies any customer credit on the account before determining the
  amount due for the invoice (i.e., the amount that will be actually
  charged). If the amount due for the invoice is less than Stripe's [minimum allowed charge
  per currency](/docs/currencies#minimum-and-maximum-charge-amounts), the
  invoice is automatically marked paid, and we add the amount due to the
  customer's credit balance which is applied to the next invoice.

  More details on the customer's credit balance are
  [here](https://stripe.com/docs/billing/customer/balance).

  Related guide: [Send Invoices to Customers](https://stripe.com/docs/billing/invoices/sending).

  **:customer_tax_exempt** :: *:string*

  The customer's tax exempt status. Until the invoice is finalized, this field will equal `customer.tax_exempt`. Once the invoice is finalized, this field will no longer be updated.


  **:auto_advance** :: *:boolean*

  Controls whether Stripe will perform [automatic collection](https://stripe.com/docs/billing/invoices/workflow/#auto_advance) of the invoice. When `false`, the invoice's state will not automatically advance without an explicit action.


  **:customer_phone** :: *:string*

  The customer's phone number. Until the invoice is finalized, this field will equal `customer.phone`. Once the invoice is finalized, this field will no longer be updated.


  **:invoice_pdf** :: *:string*

  The link to download the PDF for the invoice. If the invoice has not been finalized yet, this will be null.


  **:starting_balance** :: *:integer*

  Starting customer balance before the invoice is finalized. If the invoice has not been finalized yet, this will be the current customer balance.


  **:livemode** :: *:boolean*

  Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.


  **::customer_tax_ids** :: *ExOAPI.Stripe.Schemas.InvoicesResourceInvoiceTaxId*


  **:collection_method** :: *:string*

  Either `charge_automatically`, or `send_invoice`. When charging automatically, Stripe will attempt to pay this invoice using the default source attached to the customer. When sending an invoice, Stripe will email this invoice to the customer with payment instructions.


  **:default_payment_method** :: *ExOAPI.Stripe.Schemas.PaymentMethod | :string*

  ID of the default payment method for the invoice. It must belong to the customer associated with the invoice. If not set, defaults to the subscription's default payment method, if any, or to the default payment method in the customer's invoice settings.


  **:amount_due** :: *:integer*

  Final amount due at this time for this invoice. If the invoice's total is smaller than the minimum charge amount, for example, or if there is account credit that can be applied to the invoice, the `amount_due` may be 0. If there is a positive `starting_balance` for the invoice (the customer owes money), the `amount_due` will also take that into account. The charge that gets generated for the invoice will be for the amount specified in `amount_due`.


  **:last_finalization_error** :: *ExOAPI.Stripe.Schemas.ApiErrors*

  The error encountered during the previous attempt to finalize the invoice. This field is cleared when the invoice is successfully finalized.


  **:attempt_count** :: *:integer*

  Number of payment attempts made for this invoice, from the perspective of the payment retry schedule. Any payment attempt counts as the first attempt, and subsequently only automatic retries increment the attempt count. In other words, manual payment attempts after the first attempt do not affect the retry schedule.


  **:customer_name** :: *:string*

  The customer's name. Until the invoice is finalized, this field will equal `customer.name`. Once the invoice is finalized, this field will no longer be updated.


  **::custom_fields** :: *ExOAPI.Stripe.Schemas.InvoiceSettingCustomField*


  **:subtotal** :: *:integer*

  Total of all subscriptions, invoice items, and prorations on the invoice before any invoice level discount or tax is applied. Item discounts are already incorporated


  **:account_country** :: *:string*

  The country of the business associated with this invoice, most often the business creating the invoice.


  **:metadata** :: *:map*

  Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.


  **:description** :: *:string*

  An arbitrary string attached to the object. Often useful for displaying to users. Referenced as 'memo' in the Dashboard.


  **:paid** :: *:boolean*

  Whether payment was successfully collected for this invoice. An invoice can be paid (most commonly) with a charge or with credit from the customer's account balance.


  **:pre_payment_credit_notes_amount** :: *:integer*

  Total amount of all pre-payment credit notes issued for this invoice.


  **:subscription_proration_date** :: *:integer*

  Only set for upcoming invoices that preview prorations. The time used to calculate prorations.


  **:footer** :: *:string*

  Footer displayed on the invoice.


  **:customer_shipping** :: *ExOAPI.Stripe.Schemas.Shipping*

  The customer's shipping information. Until the invoice is finalized, this field will equal `customer.shipping`. Once the invoice is finalized, this field will no longer be updated.


  **:total** :: *:integer*

  Total after discounts and taxes.


  **:payment_intent** :: *ExOAPI.Stripe.Schemas.PaymentIntent | :string*

  The PaymentIntent associated with this invoice. The PaymentIntent is generated when the invoice is finalized, and can then be used to pay the invoice. Note that voiding an invoice will cancel the PaymentIntent.


  **:paid_out_of_band** :: *:boolean*

  Returns true if the invoice was manually marked paid, returns false if the invoice hasn't been paid yet or was paid on Stripe.


  **:threshold_reason** :: *ExOAPI.Stripe.Schemas.InvoiceThresholdReason*


  **:discount** :: *ExOAPI.Stripe.Schemas.Discount*

  Describes the current discount applied to this invoice, if there is one. Not populated if there are multiple discounts.


  **:customer_email** :: *:string*

  The customer's email. Until the invoice is finalized, this field will equal `customer.email`. Once the invoice is finalized, this field will no longer be updated.


  **:on_behalf_of** :: *ExOAPI.Stripe.Schemas.Account | :string*

  The account (if any) for which the funds of the invoice payment are intended. If set, the invoice will be presented with the branding and support information of the specified account. See the [Invoices with Connect](https://stripe.com/docs/billing/invoices/connect) documentation for details.


  **:charge** :: *ExOAPI.Stripe.Schemas.Charge | :string*

  ID of the latest charge generated for this invoice, if any.


  **:account_name** :: *:string*

  The public name of the business associated with this invoice, most often the business creating the invoice.


  **:customer** :: *ExOAPI.Stripe.Schemas.DeletedCustomer | ExOAPI.Stripe.Schemas.Customer | :string*

  The ID of the customer who will be billed.


  **:amount_paid** :: *:integer*

  The amount, in %s, that was paid.


  **::account_tax_ids** :: *ExOAPI.Stripe.Schemas.DeletedTaxId | ExOAPI.Stripe.Schemas.TaxId | :string*


  **:hosted_invoice_url** :: *:string*

  The URL for the hosted invoice page, which allows customers to view and pay an invoice. If the invoice has not been finalized yet, this will be null.


  **:statement_descriptor** :: *:string*

  Extra information about an invoice for the customer's credit card statement.


  **:payment_settings** :: *ExOAPI.Stripe.Schemas.InvoicesPaymentSettings*


  **:due_date** :: *:integer*

  The date on which payment for this invoice is due. This value will be `null` for invoices where `collection_method=charge_automatically`.


  **:default_source** :: *ExOAPI.Stripe.Schemas.Source | ExOAPI.Stripe.Schemas.Card | ExOAPI.Stripe.Schemas.BitcoinReceiver | ExOAPI.Stripe.Schemas.BankAccount | ExOAPI.Stripe.Schemas.AlipayAccount | :string*

  ID of the default payment source for the invoice. It must belong to the customer associated with the invoice and be in a chargeable state. If not set, defaults to the subscription's default source, if any, or to the customer's default source.


  **:receipt_number** :: *:string*

  This is the transaction number that appears on email receipts sent for this invoice.


  **:billing_reason** :: *:string*

  Indicates the reason why the invoice was created. `subscription_cycle` indicates an invoice created by a subscription advancing into a new period. `subscription_create` indicates an invoice created due to creating a subscription. `subscription_update` indicates an invoice created due to updating a subscription. `subscription` is set for all old invoices to indicate either a change to a subscription or a period advancement. `manual` is set for all invoices unrelated to a subscription (for example: created via the invoice editor). The `upcoming` value is reserved for simulated invoices per the upcoming invoice endpoint. `subscription_threshold` indicates an invoice created due to a billing threshold being reached.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  **:status_transitions** :: *ExOAPI.Stripe.Schemas.InvoicesStatusTransitions*


  **:post_payment_credit_notes_amount** :: *:integer*

  Total amount of all post-payment credit notes issued for this invoice.


  **:test_clock** :: *ExOAPI.Stripe.Schemas.TestHelpers_testClock | :string*

  ID of the test clock this invoice belongs to.


  **:automatic_tax** :: *ExOAPI.Stripe.Schemas.AutomaticTax*


  **:currency** :: *:string*

  Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).


  **::total_discount_amounts** :: *ExOAPI.Stripe.Schemas.DiscountsResourceDiscountAmount*


  **:created** :: *:integer*

  Time at which the object was created. Measured in seconds since the Unix epoch.


  **::discounts** :: *ExOAPI.Stripe.Schemas.DeletedDiscount | ExOAPI.Stripe.Schemas.Discount | :string*


  **:quote** :: *ExOAPI.Stripe.Schemas.Quote | :string*

  The quote this invoice was generated from.


  **:amount_remaining** :: *:integer*

  The amount remaining, in %s, that is due.


  **:period_end** :: *:integer*

  End of the usage period during which invoice items were added to this invoice.


  **:next_payment_attempt** :: *:integer*

  The time at which payment will next be attempted. This value will be `null` for invoices where `collection_method=send_invoice`.


  **:subscription** :: *ExOAPI.Stripe.Schemas.Subscription | :string*

  The subscription that this invoice was prepared for, if any.


  **:webhooks_delivered_at** :: *:integer*

  Invoices are automatically paid or sent 1 hour after webhooks are delivered, or until all webhook delivery attempts have [been exhausted](https://stripe.com/docs/billing/webhooks#understand). This field tracks the time when webhooks for this invoice were successfully delivered. If the invoice had no webhooks to deliver, this will be set while the invoice is being created.


  **::total_tax_amounts** :: *ExOAPI.Stripe.Schemas.InvoiceTaxAmount*


  **:status** :: *:string*

  The status of the invoice, one of `draft`, `open`, `paid`, `uncollectible`, or `void`. [Learn more](https://stripe.com/docs/billing/invoices/workflow#workflow-overview)


  **:ending_balance** :: *:integer*

  Ending customer balance after the invoice is finalized. Invoices are finalized approximately an hour after successful webhook delivery or when payment collection is attempted for the invoice. If the invoice has not been finalized yet, this will be null.


  **:customer_address** :: *ExOAPI.Stripe.Schemas.Address*

  The customer's address. Until the invoice is finalized, this field will equal `customer.address`. Once the invoice is finalized, this field will no longer be updated.


  **:number** :: *:string*

  A unique, identifying string that appears on emails sent to the customer for this invoice. This starts with the customer's unique invoice_prefix if it is specified.


  **:application_fee_amount** :: *:integer*

  The fee in %s that will be applied to the invoice and transferred to the application owner's Stripe account when the invoice is paid.


  **:tax** :: *:integer*

  The amount of tax on this invoice. This is the sum of all the tax amounts on this invoice.


  **:period_start** :: *:integer*

  Start of the usage period during which invoice items were added to this invoice.


  **:transfer_data** :: *ExOAPI.Stripe.Schemas.InvoiceTransferData*

  The account (if any) the payment will be attributed to for tax reporting, and where funds from the payment will be transferred to for the invoice.


  **:attempted** :: *:boolean*

  Whether an attempt has been made to pay the invoice. An invoice is not attempted until 1 hour after the `invoice.created` webhook, for example, so you might not want to display that invoice as unpaid to your users.


  **:id** :: *:string*

  Unique identifier for the object.


  **::default_tax_rates** :: *ExOAPI.Stripe.Schemas.TaxRate*


  **::data** :: *ExOAPI.Stripe.Schemas.LineItem*


  **:has_more** :: *:boolean*

  True if this list has another page of items after this one that can be fetched.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value. Always has the value `list`.


  **:url** :: *:string*

  The URL where this list can be accessed.


  """

  @primary_key false
  typed_embedded_schema do
    field(:customer_tax_exempt, Ecto.Enum, values: [:reverse, :none, :exempt])

    field(:auto_advance, :boolean)

    field(:customer_phone, :string)

    field(:invoice_pdf, :string)

    field(:starting_balance, :integer)

    field(:livemode, :boolean)

    embeds_many(:customer_tax_ids, ExOAPI.Stripe.Schemas.InvoicesResourceInvoiceTaxId)

    field(:collection_method, Ecto.Enum, values: [:send_invoice, :charge_automatically])

    field(:default_payment_method, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.PaymentMethod]
    )

    field(:amount_due, :integer)

    field(:last_finalization_error, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.ApiErrors]
    )

    field(:attempt_count, :integer)

    field(:customer_name, :string)

    embeds_many(:custom_fields, ExOAPI.Stripe.Schemas.InvoiceSettingCustomField)

    field(:subtotal, :integer)

    field(:account_country, :string)

    field(:metadata, :map)

    field(:description, :string)

    field(:paid, :boolean)

    field(:pre_payment_credit_notes_amount, :integer)

    field(:subscription_proration_date, :integer)

    field(:footer, :string)

    field(:customer_shipping, ExOAPI.EctoTypes.AnyOf, types: [ExOAPI.Stripe.Schemas.Shipping])

    field(:total, :integer)

    field(:payment_intent, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.PaymentIntent]
    )

    field(:paid_out_of_band, :boolean)

    embeds_one(:threshold_reason, ExOAPI.Stripe.Schemas.InvoiceThresholdReason)

    field(:discount, ExOAPI.EctoTypes.AnyOf, types: [ExOAPI.Stripe.Schemas.Discount])

    field(:customer_email, :string)

    field(:on_behalf_of, ExOAPI.EctoTypes.AnyOf, types: [:string, ExOAPI.Stripe.Schemas.Account])

    field(:charge, ExOAPI.EctoTypes.AnyOf, types: [:string, ExOAPI.Stripe.Schemas.Charge])

    field(:account_name, :string)

    field(:customer, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.Customer, ExOAPI.Stripe.Schemas.DeletedCustomer]
    )

    field(:amount_paid, :integer)

    field(:account_tax_ids, {:array, ExOAPI.EctoTypes.AnyOf},
      types: [ExOAPI.Stripe.Schemas.DeletedTaxId, ExOAPI.Stripe.Schemas.TaxId, :string]
    )

    field(:hosted_invoice_url, :string)

    field(:statement_descriptor, :string)

    embeds_one(:payment_settings, ExOAPI.Stripe.Schemas.InvoicesPaymentSettings)

    field(:due_date, :integer)

    field(:default_source, ExOAPI.EctoTypes.AnyOf,
      types: [
        :string,
        ExOAPI.Stripe.Schemas.AlipayAccount,
        ExOAPI.Stripe.Schemas.BankAccount,
        ExOAPI.Stripe.Schemas.BitcoinReceiver,
        ExOAPI.Stripe.Schemas.Card,
        ExOAPI.Stripe.Schemas.Source
      ]
    )

    field(:receipt_number, :string)

    field(:billing_reason, Ecto.Enum,
      values: [
        :upcoming,
        :subscription_update,
        :subscription_threshold,
        :subscription_cycle,
        :subscription_create,
        :subscription,
        :quote_accept,
        :manual,
        :automatic_pending_invoice_item_invoice
      ]
    )

    field(:object, Ecto.Enum, values: [:invoice])

    embeds_one(:status_transitions, ExOAPI.Stripe.Schemas.InvoicesStatusTransitions)

    field(:post_payment_credit_notes_amount, :integer)

    field(:test_clock, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.TestHelpers_testClock]
    )

    embeds_one(:automatic_tax, ExOAPI.Stripe.Schemas.AutomaticTax)

    field(:currency, :string)

    embeds_many(:total_discount_amounts, ExOAPI.Stripe.Schemas.DiscountsResourceDiscountAmount)

    field(:created, :integer)

    field(:discounts, {:array, ExOAPI.EctoTypes.AnyOf},
      types: [ExOAPI.Stripe.Schemas.DeletedDiscount, ExOAPI.Stripe.Schemas.Discount, :string]
    )

    field(:quote, ExOAPI.EctoTypes.AnyOf, types: [:string, ExOAPI.Stripe.Schemas.Quote])

    field(:amount_remaining, :integer)

    field(:period_end, :integer)

    field(:next_payment_attempt, :integer)

    field(:subscription, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.Subscription]
    )

    field(:webhooks_delivered_at, :integer)

    embeds_many(:total_tax_amounts, ExOAPI.Stripe.Schemas.InvoiceTaxAmount)

    field(:status, Ecto.Enum, values: [:void, :uncollectible, :paid, :open, :draft, :deleted])

    field(:ending_balance, :integer)

    field(:customer_address, ExOAPI.EctoTypes.AnyOf, types: [ExOAPI.Stripe.Schemas.Address])

    field(:number, :string)

    field(:application_fee_amount, :integer)

    field(:tax, :integer)

    field(:period_start, :integer)

    field(:transfer_data, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.InvoiceTransferData]
    )

    field(:attempted, :boolean)

    field(:id, :string)

    embeds_many(:default_tax_rates, ExOAPI.Stripe.Schemas.TaxRate)

    field(:lines, :map)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :lines,
      :id,
      :attempted,
      :transfer_data,
      :period_start,
      :tax,
      :application_fee_amount,
      :number,
      :customer_address,
      :ending_balance,
      :status,
      :webhooks_delivered_at,
      :subscription,
      :next_payment_attempt,
      :period_end,
      :amount_remaining,
      :quote,
      :discounts,
      :created,
      :currency,
      :test_clock,
      :post_payment_credit_notes_amount,
      :object,
      :billing_reason,
      :receipt_number,
      :default_source,
      :due_date,
      :statement_descriptor,
      :hosted_invoice_url,
      :account_tax_ids,
      :amount_paid,
      :customer,
      :account_name,
      :charge,
      :on_behalf_of,
      :customer_email,
      :discount,
      :paid_out_of_band,
      :payment_intent,
      :total,
      :customer_shipping,
      :footer,
      :subscription_proration_date,
      :pre_payment_credit_notes_amount,
      :paid,
      :description,
      :metadata,
      :account_country,
      :subtotal,
      :customer_name,
      :attempt_count,
      :last_finalization_error,
      :amount_due,
      :default_payment_method,
      :collection_method,
      :livemode,
      :starting_balance,
      :invoice_pdf,
      :customer_phone,
      :auto_advance,
      :customer_tax_exempt
    ])
    |> validate_required([
      :lines,
      :attempted,
      :period_start,
      :period_end,
      :amount_remaining,
      :created,
      :currency,
      :post_payment_credit_notes_amount,
      :object,
      :amount_paid,
      :paid_out_of_band,
      :total,
      :pre_payment_credit_notes_amount,
      :paid,
      :subtotal,
      :attempt_count,
      :amount_due,
      :collection_method,
      :livemode,
      :starting_balance
    ])
    |> cast_embed(:default_tax_rates, required: true)
    |> cast_embed(:total_tax_amounts, required: true)
    |> cast_embed(:total_discount_amounts)
    |> cast_embed(:automatic_tax, required: true)
    |> cast_embed(:status_transitions, required: true)
    |> cast_embed(:payment_settings, required: true)
    |> cast_embed(:threshold_reason)
    |> cast_embed(:custom_fields)
    |> cast_embed(:customer_tax_ids)
  end
end