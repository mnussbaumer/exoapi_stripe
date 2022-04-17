defmodule ExOAPI.Stripe.Schemas.SubscriptionSchedulesResourceDefaultSettings do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:application_fee_percent** :: *:number*

  A non-negative decimal between 0 and 100, with at most two decimal places. This represents the percentage of the subscription invoice subtotal that will be transferred to the application owner's Stripe account during this phase of the schedule.


  **:automatic_tax** :: *ExOAPI.Stripe.Schemas.SubscriptionSchedulesResourceDefaultSettingsAutomaticTax*


  **:billing_cycle_anchor** :: *:string*

  Possible values are `phase_start` or `automatic`. If `phase_start` then billing cycle anchor of the subscription is set to the start of the phase when entering the phase. If `automatic` then the billing cycle anchor is automatically modified as needed when entering the phase. For more information, see the billing cycle [documentation](https://stripe.com/docs/billing/subscriptions/billing-cycle).


  **:billing_thresholds** :: *ExOAPI.Stripe.Schemas.SubscriptionBillingThresholds*

  Define thresholds at which an invoice will be sent, and the subscription advanced to a new billing period


  **:collection_method** :: *:string*

  Either `charge_automatically`, or `send_invoice`. When charging automatically, Stripe will attempt to pay the underlying subscription at the end of each billing cycle using the default source attached to the customer. When sending an invoice, Stripe will email your customer an invoice with payment instructions.


  **:default_payment_method** :: *ExOAPI.Stripe.Schemas.PaymentMethod | :string*

  ID of the default payment method for the subscription schedule. If not set, invoices will use the default payment method in the customer's invoice settings.


  **:invoice_settings** :: *ExOAPI.Stripe.Schemas.InvoiceSettingSubscriptionScheduleSetting*

  The subscription schedule's default invoice settings.


  **:transfer_data** :: *ExOAPI.Stripe.Schemas.SubscriptionTransferData*

  The account (if any) the associated subscription's payments will be attributed to for tax reporting, and where funds from each payment will be transferred to for each of the subscription's invoices.


  """

  @primary_key false
  typed_embedded_schema do
    field(:application_fee_percent, :float)

    embeds_one(
      :automatic_tax,
      ExOAPI.Stripe.Schemas.SubscriptionSchedulesResourceDefaultSettingsAutomaticTax
    )

    field(:billing_cycle_anchor, Ecto.Enum, values: [:phase_start, :automatic])

    field(:billing_thresholds, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.SubscriptionBillingThresholds]
    )

    field(:collection_method, Ecto.Enum, values: [:send_invoice, :charge_automatically])

    field(:default_payment_method, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.PaymentMethod]
    )

    field(:invoice_settings, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.InvoiceSettingSubscriptionScheduleSetting]
    )

    field(:transfer_data, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.SubscriptionTransferData]
    )
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :transfer_data,
      :invoice_settings,
      :default_payment_method,
      :collection_method,
      :billing_thresholds,
      :billing_cycle_anchor,
      :application_fee_percent
    ])
    |> validate_required([:billing_cycle_anchor])
    |> cast_embed(:automatic_tax)
  end
end