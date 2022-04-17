defmodule ExOAPI.Stripe.Schemas.SubscriptionSchedulePhaseConfiguration do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: A phase describes the plans, coupon, and trialing status of a subscription for a predefined time period.

  **::add_invoice_items** :: *ExOAPI.Stripe.Schemas.SubscriptionScheduleAddInvoiceItem*


  **:application_fee_percent** :: *:number*

  A non-negative decimal between 0 and 100, with at most two decimal places. This represents the percentage of the subscription invoice subtotal that will be transferred to the application owner's Stripe account during this phase of the schedule.


  **:automatic_tax** :: *ExOAPI.Stripe.Schemas.SchedulesPhaseAutomaticTax*


  **:billing_cycle_anchor** :: *:string*

  Possible values are `phase_start` or `automatic`. If `phase_start` then billing cycle anchor of the subscription is set to the start of the phase when entering the phase. If `automatic` then the billing cycle anchor is automatically modified as needed when entering the phase. For more information, see the billing cycle [documentation](https://stripe.com/docs/billing/subscriptions/billing-cycle).


  **:billing_thresholds** :: *ExOAPI.Stripe.Schemas.SubscriptionBillingThresholds*

  Define thresholds at which an invoice will be sent, and the subscription advanced to a new billing period


  **:collection_method** :: *:string*

  Either `charge_automatically`, or `send_invoice`. When charging automatically, Stripe will attempt to pay the underlying subscription at the end of each billing cycle using the default source attached to the customer. When sending an invoice, Stripe will email your customer an invoice with payment instructions.


  **:coupon** :: *ExOAPI.Stripe.Schemas.DeletedCoupon | ExOAPI.Stripe.Schemas.Coupon | :string*

  ID of the coupon to use during this phase of the subscription schedule.


  **:default_payment_method** :: *ExOAPI.Stripe.Schemas.PaymentMethod | :string*

  ID of the default payment method for the subscription schedule. It must belong to the customer associated with the subscription schedule. If not set, invoices will use the default payment method in the customer's invoice settings.


  **::default_tax_rates** :: *ExOAPI.Stripe.Schemas.TaxRate*


  **:end_date** :: *:integer*

  The end of this phase of the subscription schedule.


  **:invoice_settings** :: *ExOAPI.Stripe.Schemas.InvoiceSettingSubscriptionScheduleSetting*

  The invoice settings applicable during this phase.


  **::items** :: *ExOAPI.Stripe.Schemas.SubscriptionScheduleConfigurationItem*


  **:proration_behavior** :: *:string*

  If the subscription schedule will prorate when transitioning to this phase. Possible values are `create_prorations` and `none`.


  **:start_date** :: *:integer*

  The start of this phase of the subscription schedule.


  **:transfer_data** :: *ExOAPI.Stripe.Schemas.SubscriptionTransferData*

  The account (if any) the associated subscription's payments will be attributed to for tax reporting, and where funds from each payment will be transferred to for each of the subscription's invoices.


  **:trial_end** :: *:integer*

  When the trial ends within the phase.


  """

  @primary_key false
  typed_embedded_schema do
    embeds_many(:add_invoice_items, ExOAPI.Stripe.Schemas.SubscriptionScheduleAddInvoiceItem)

    field(:application_fee_percent, :float)

    embeds_one(:automatic_tax, ExOAPI.Stripe.Schemas.SchedulesPhaseAutomaticTax)

    field(:billing_cycle_anchor, Ecto.Enum, values: [:phase_start, :automatic])

    field(:billing_thresholds, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.SubscriptionBillingThresholds]
    )

    field(:collection_method, Ecto.Enum, values: [:send_invoice, :charge_automatically])

    field(:coupon, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.Coupon, ExOAPI.Stripe.Schemas.DeletedCoupon]
    )

    field(:default_payment_method, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.PaymentMethod]
    )

    embeds_many(:default_tax_rates, ExOAPI.Stripe.Schemas.TaxRate)

    field(:end_date, :integer)

    field(:invoice_settings, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.InvoiceSettingSubscriptionScheduleSetting]
    )

    embeds_many(:items, ExOAPI.Stripe.Schemas.SubscriptionScheduleConfigurationItem)

    field(:proration_behavior, Ecto.Enum, values: [:none, :create_prorations, :always_invoice])

    field(:start_date, :integer)

    field(:transfer_data, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.SubscriptionTransferData]
    )

    field(:trial_end, :integer)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :trial_end,
      :transfer_data,
      :start_date,
      :proration_behavior,
      :invoice_settings,
      :end_date,
      :default_payment_method,
      :coupon,
      :collection_method,
      :billing_thresholds,
      :billing_cycle_anchor,
      :application_fee_percent
    ])
    |> validate_required([:start_date, :proration_behavior, :end_date])
    |> cast_embed(:items, required: true)
    |> cast_embed(:default_tax_rates)
    |> cast_embed(:automatic_tax)
    |> cast_embed(:add_invoice_items, required: true)
  end
end