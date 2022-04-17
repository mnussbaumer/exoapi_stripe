defmodule ExOAPI.Stripe.Schemas.Subscription do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: Subscriptions allow you to charge a customer on a recurring basis.

  Related guide: [Creating Subscriptions](https://stripe.com/docs/billing/subscriptions/creating).

  **:application_fee_percent** :: *:number*

  A non-negative decimal between 0 and 100, with at most two decimal places. This represents the percentage of the subscription invoice subtotal that will be transferred to the application owner's Stripe account.


  **:livemode** :: *:boolean*

  Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.


  **:collection_method** :: *:string*

  Either `charge_automatically`, or `send_invoice`. When charging automatically, Stripe will attempt to pay this subscription at the end of the cycle using the default source attached to the customer. When sending an invoice, Stripe will email your customer an invoice with payment instructions.


  **:default_payment_method** :: *ExOAPI.Stripe.Schemas.PaymentMethod | :string*

  ID of the default payment method for the subscription. It must belong to the customer associated with the subscription. This takes precedence over `default_source`. If neither are set, invoices will use the customer's [invoice_settings.default_payment_method](https://stripe.com/docs/api/customers/object#customer_object-invoice_settings-default_payment_method) or [default_source](https://stripe.com/docs/api/customers/object#customer_object-default_source).


  **:metadata** :: *:map*

  Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.


  **:pending_setup_intent** :: *ExOAPI.Stripe.Schemas.SetupIntent | :string*

  You can use this [SetupIntent](https://stripe.com/docs/api/setup_intents) to collect user authentication when creating a subscription without immediate payment or updating a subscription's payment method, allowing you to optimize for off-session payments. Learn more in the [SCA Migration Guide](https://stripe.com/docs/billing/migration/strong-customer-authentication#scenario-2).


  **:discount** :: *ExOAPI.Stripe.Schemas.Discount*

  Describes the current discount applied to this subscription, if there is one. When billing, a discount applied to a subscription overrides a discount applied on a customer-wide basis.


  **:start_date** :: *:integer*

  Date when the subscription was first created. The date might differ from the `created` date due to backdating.


  **:pause_collection** :: *ExOAPI.Stripe.Schemas.SubscriptionsResourcePauseCollection*

  If specified, payment collection for this subscription will be paused.


  **:customer** :: *ExOAPI.Stripe.Schemas.DeletedCustomer | ExOAPI.Stripe.Schemas.Customer | :string*

  ID of the customer who owns the subscription.


  **:ended_at** :: *:integer*

  If the subscription has ended, the date the subscription ended.


  **:days_until_due** :: *:integer*

  Number of days a customer has to pay invoices generated by this subscription. This value will be `null` for subscriptions where `collection_method=charge_automatically`.


  **:payment_settings** :: *ExOAPI.Stripe.Schemas.SubscriptionsResourcePaymentSettings*

  Payment settings passed on to invoices created by the subscription.


  **:pending_invoice_item_interval** :: *ExOAPI.Stripe.Schemas.SubscriptionPendingInvoiceItemInterval*

  Specifies an interval for how often to bill for any pending invoice items. It is analogous to calling [Create an invoice](https://stripe.com/docs/api#create_invoice) for the given subscription at the specified interval.


  **:billing_thresholds** :: *ExOAPI.Stripe.Schemas.SubscriptionBillingThresholds*

  Define thresholds at which an invoice will be sent, and the subscription advanced to a new billing period


  **:next_pending_invoice_item_invoice** :: *:integer*

  Specifies the approximate timestamp on which any pending invoice items will be billed according to the schedule provided at `pending_invoice_item_interval`.


  **:default_source** :: *ExOAPI.Stripe.Schemas.Source | ExOAPI.Stripe.Schemas.Card | ExOAPI.Stripe.Schemas.BitcoinReceiver | ExOAPI.Stripe.Schemas.BankAccount | ExOAPI.Stripe.Schemas.AlipayAccount | :string*

  ID of the default payment source for the subscription. It must belong to the customer associated with the subscription and be in a chargeable state. If `default_payment_method` is also set, `default_payment_method` will take precedence. If neither are set, invoices will use the customer's [invoice_settings.default_payment_method](https://stripe.com/docs/api/customers/object#customer_object-invoice_settings-default_payment_method) or [default_source](https://stripe.com/docs/api/customers/object#customer_object-default_source).


  **:cancel_at_period_end** :: *:boolean*

  If the subscription has been canceled with the `at_period_end` flag set to `true`, `cancel_at_period_end` on the subscription will be true. You can use this attribute to determine whether a subscription that has a status of active is scheduled to be canceled at the end of the current period.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  **:billing_cycle_anchor** :: *:integer*

  Determines the date of the first full invoice, and, for plans with `month` or `year` intervals, the day of the month for subsequent invoices.


  **:test_clock** :: *ExOAPI.Stripe.Schemas.TestHelpers_testClock | :string*

  ID of the test clock this subscription belongs to.


  **:automatic_tax** :: *ExOAPI.Stripe.Schemas.SubscriptionAutomaticTax*


  **:schedule** :: *ExOAPI.Stripe.Schemas.SubscriptionSchedule | :string*

  The schedule attached to the subscription


  **:canceled_at** :: *:integer*

  If the subscription has been canceled, the date of that cancellation. If the subscription was canceled with `cancel_at_period_end`, `canceled_at` will reflect the time of the most recent update request, not the end of the subscription period when the subscription is automatically moved to a canceled state.


  **:current_period_end** :: *:integer*

  End of the current period that the subscription has been invoiced for. At the end of this period, a new invoice will be created.


  **:latest_invoice** :: *ExOAPI.Stripe.Schemas.Invoice | :string*

  The most recent invoice this subscription has generated.


  **:created** :: *:integer*

  Time at which the object was created. Measured in seconds since the Unix epoch.


  **:trial_end** :: *:integer*

  If the subscription has a trial, the end of that trial.


  **:cancel_at** :: *:integer*

  A date in the future at which the subscription will automatically get canceled


  **:trial_start** :: *:integer*

  If the subscription has a trial, the beginning of that trial.


  **:current_period_start** :: *:integer*

  Start of the current period that the subscription has been invoiced for.


  **:status** :: *:string*

  Possible values are `incomplete`, `incomplete_expired`, `trialing`, `active`, `past_due`, `canceled`, or `unpaid`. 

  For `collection_method=charge_automatically` a subscription moves into `incomplete` if the initial payment attempt fails. A subscription in this state can only have metadata and default_source updated. Once the first invoice is paid, the subscription moves into an `active` state. If the first invoice is not paid within 23 hours, the subscription transitions to `incomplete_expired`. This is a terminal state, the open invoice will be voided and no further invoices will be generated. 

  A subscription that is currently in a trial period is `trialing` and moves to `active` when the trial period is over. 

  If subscription `collection_method=charge_automatically` it becomes `past_due` when payment to renew it fails and `canceled` or `unpaid` (depending on your subscriptions settings) when Stripe has exhausted all payment retry attempts. 

  If subscription `collection_method=send_invoice` it becomes `past_due` when its invoice is not paid by the due date, and `canceled` or `unpaid` if it is still not paid by an additional deadline after that. Note that when a subscription has a status of `unpaid`, no subsequent invoices will be attempted (invoices will be created, but then immediately automatically closed). After receiving updated payment information from a customer, you may choose to reopen and pay their closed invoices.


  **::data** :: *ExOAPI.Stripe.Schemas.SubscriptionItem*


  **:has_more** :: *:boolean*

  True if this list has another page of items after this one that can be fetched.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value. Always has the value `list`.


  **:url** :: *:string*

  The URL where this list can be accessed.


  **:transfer_data** :: *ExOAPI.Stripe.Schemas.SubscriptionTransferData*

  The account (if any) the subscription's payments will be attributed to for tax reporting, and where funds from each payment will be transferred to for each of the subscription's invoices.


  **:id** :: *:string*

  Unique identifier for the object.


  **:pending_update** :: *ExOAPI.Stripe.Schemas.SubscriptionsResourcePendingUpdate*

  If specified, [pending updates](https://stripe.com/docs/billing/subscriptions/pending-updates) that will be applied to the subscription once the `latest_invoice` has been paid.


  **::default_tax_rates** :: *ExOAPI.Stripe.Schemas.TaxRate*


  """

  @primary_key false
  typed_embedded_schema do
    field(:application_fee_percent, :float)

    field(:livemode, :boolean)

    field(:collection_method, Ecto.Enum, values: [:send_invoice, :charge_automatically])

    field(:default_payment_method, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.PaymentMethod]
    )

    field(:metadata, :map)

    field(:pending_setup_intent, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.SetupIntent]
    )

    field(:discount, ExOAPI.EctoTypes.AnyOf, types: [ExOAPI.Stripe.Schemas.Discount])

    field(:start_date, :integer)

    field(:pause_collection, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.SubscriptionsResourcePauseCollection]
    )

    field(:customer, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.Customer, ExOAPI.Stripe.Schemas.DeletedCustomer]
    )

    field(:ended_at, :integer)

    field(:days_until_due, :integer)

    field(:payment_settings, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.SubscriptionsResourcePaymentSettings]
    )

    field(:pending_invoice_item_interval, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.SubscriptionPendingInvoiceItemInterval]
    )

    field(:billing_thresholds, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.SubscriptionBillingThresholds]
    )

    field(:next_pending_invoice_item_invoice, :integer)

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

    field(:cancel_at_period_end, :boolean)

    field(:object, Ecto.Enum, values: [:subscription])

    field(:billing_cycle_anchor, :integer)

    field(:test_clock, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.TestHelpers_testClock]
    )

    embeds_one(:automatic_tax, ExOAPI.Stripe.Schemas.SubscriptionAutomaticTax)

    field(:schedule, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.SubscriptionSchedule]
    )

    field(:canceled_at, :integer)

    field(:current_period_end, :integer)

    field(:latest_invoice, ExOAPI.EctoTypes.AnyOf, types: [:string, ExOAPI.Stripe.Schemas.Invoice])

    field(:created, :integer)

    field(:trial_end, :integer)

    field(:cancel_at, :integer)

    field(:trial_start, :integer)

    field(:current_period_start, :integer)

    field(:status, Ecto.Enum,
      values: [
        :unpaid,
        :trialing,
        :past_due,
        :incomplete_expired,
        :incomplete,
        :canceled,
        :active
      ]
    )

    field(:items, :map)

    field(:transfer_data, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.SubscriptionTransferData]
    )

    field(:id, :string)

    field(:pending_update, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.SubscriptionsResourcePendingUpdate]
    )

    embeds_many(:default_tax_rates, ExOAPI.Stripe.Schemas.TaxRate)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :pending_update,
      :id,
      :transfer_data,
      :items,
      :status,
      :current_period_start,
      :trial_start,
      :cancel_at,
      :trial_end,
      :created,
      :latest_invoice,
      :current_period_end,
      :canceled_at,
      :schedule,
      :test_clock,
      :billing_cycle_anchor,
      :object,
      :cancel_at_period_end,
      :default_source,
      :next_pending_invoice_item_invoice,
      :billing_thresholds,
      :pending_invoice_item_interval,
      :payment_settings,
      :days_until_due,
      :ended_at,
      :customer,
      :pause_collection,
      :start_date,
      :discount,
      :pending_setup_intent,
      :metadata,
      :default_payment_method,
      :collection_method,
      :livemode,
      :application_fee_percent
    ])
    |> validate_required([
      :id,
      :items,
      :status,
      :current_period_start,
      :created,
      :current_period_end,
      :billing_cycle_anchor,
      :object,
      :cancel_at_period_end,
      :customer,
      :start_date,
      :metadata,
      :collection_method,
      :livemode
    ])
    |> cast_embed(:default_tax_rates)
    |> cast_embed(:automatic_tax, required: true)
  end
end