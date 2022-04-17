defmodule ExOAPI.Stripe.Schemas.Charge do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: To charge a credit or a debit card, you create a `Charge` object. You can
  retrieve and refund individual charges as well as list all charges. Charges
  are identified by a unique, random ID.

  Related guide: [Accept a payment with the Charges API](https://stripe.com/docs/payments/accept-a-payment-charges).

  **:receipt_url** :: *:string*

  This is the URL to view the receipt for this charge. The receipt is kept up-to-date to the latest state of the charge, including any refunds. If the charge is for an Invoice, the receipt will be stylized as an Invoice receipt.


  **:payment_method** :: *ExOAPI.Stripe.Schemas.PaymentMethod*

  ID of the payment method used in this charge.


  **:livemode** :: *:boolean*

  Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.


  **:calculated_statement_descriptor** :: *:string*

  The full statement descriptor that is passed to card networks, and that is displayed on your customers' credit card and bank statements. Allows you to see what the statement descriptor looks like after the static and dynamic portions are combined.


  **:metadata** :: *:map*

  Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.


  **:description** :: *:string*

  An arbitrary string attached to the object. Often useful for displaying to users.


  **:paid** :: *:boolean*

  `true` if the charge succeeded, or was successfully authorized for later capture.


  **:application_fee** :: *ExOAPI.Stripe.Schemas.ApplicationFee | :string*

  The application fee (if any) for the charge. [See the Connect documentation](https://stripe.com/docs/connect/direct-charges#collecting-fees) for details.


  **:failure_message** :: *:string*

  Message to user further explaining reason for charge failure if available.


  **:review** :: *ExOAPI.Stripe.Schemas.Review | :string*

  ID of the review associated with this charge if one exists.


  **:payment_intent** :: *ExOAPI.Stripe.Schemas.PaymentIntent | :string*

  ID of the PaymentIntent associated with this charge, if one exists.


  **::data** :: *ExOAPI.Stripe.Schemas.Refund*


  **:has_more** :: *:boolean*

  True if this list has another page of items after this one that can be fetched.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value. Always has the value `list`.


  **:url** :: *:string*

  The URL where this list can be accessed.


  **:on_behalf_of** :: *ExOAPI.Stripe.Schemas.Account | :string*

  The account (if any) the charge was made on behalf of without triggering an automatic transfer. See the [Connect documentation](https://stripe.com/docs/connect/charges-transfers) for details.


  **:customer** :: *ExOAPI.Stripe.Schemas.DeletedCustomer | ExOAPI.Stripe.Schemas.Customer | :string*

  ID of the customer this charge is for if one exists.


  **:fraud_details** :: *ExOAPI.Stripe.Schemas.ChargeFraudDetails*

  Information on fraud assessments for the charge.


  **:amount** :: *:integer*

  Amount intended to be collected by this payment. A positive integer representing how much to charge in the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal) (e.g., 100 cents to charge $1.00 or 100 to charge ¥100, a zero-decimal currency). The minimum amount is $0.50 US or [equivalent in charge currency](https://stripe.com/docs/currencies#minimum-and-maximum-charge-amounts). The amount value supports up to eight digits (e.g., a value of 99999999 for a USD charge of $999,999.99).


  **:outcome** :: *ExOAPI.Stripe.Schemas.ChargeOutcome*

  Details about whether the payment was accepted, and why. See [understanding declines](https://stripe.com/docs/declines) for details.


  **:invoice** :: *ExOAPI.Stripe.Schemas.Invoice | :string*

  ID of the invoice this charge is for if one exists.


  **:payment_method_details** :: *ExOAPI.Stripe.Schemas.PaymentMethodDetails*

  Details about the payment method at the time of the transaction.


  **:statement_descriptor** :: *:string*

  For card charges, use `statement_descriptor_suffix` instead. Otherwise, you can use this value as the complete description of a charge on your customers’ statements. Must contain at least one letter, maximum 22 characters.


  **:balance_transaction** :: *ExOAPI.Stripe.Schemas.BalanceTransaction | :string*

  ID of the balance transaction that describes the impact of this charge on your account balance (not including refunds or disputes).


  **:application** :: *ExOAPI.Stripe.Schemas.Application | :string*

  ID of the Connect application that created the charge.


  **:receipt_email** :: *:string*

  This is the email address that the receipt for this charge was sent to.


  **:failure_balance_transaction** :: *ExOAPI.Stripe.Schemas.BalanceTransaction | :string*

  ID of the balance transaction that describes the reversal of the balance on your account due to payment failure.


  **:receipt_number** :: *:string*

  This is the transaction number that appears on email receipts sent for this charge. This attribute will be `null` until a receipt has been sent.


  **:failure_code** :: *:string*

  Error code explaining reason for charge failure if available (see [the errors section](https://stripe.com/docs/api#errors) for a list of codes).


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  **:amount_captured** :: *:integer*

  Amount in %s captured (can be less than the amount attribute on the charge if a partial capture was made).


  **:order** :: *ExOAPI.Stripe.Schemas.Order | :string*

  ID of the order this charge is for if one exists.


  **:billing_details** :: *ExOAPI.Stripe.Schemas.BillingDetails*


  **:captured** :: *:boolean*

  If the charge was created without capturing, this Boolean represents whether it is still uncaptured or has since been captured.


  **:amount_refunded** :: *:integer*

  Amount in %s refunded (can be less than the amount attribute on the charge if a partial refund was issued).


  **:refunded** :: *:boolean*

  Whether the charge has been fully refunded. If the charge is only partially refunded, this attribute will still be false.


  **:currency** :: *:string*

  Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).


  **:created** :: *:integer*

  Time at which the object was created. Measured in seconds since the Unix epoch.


  **:transfer** :: *ExOAPI.Stripe.Schemas.Transfer | :string*

  ID of the transfer to the `destination` account (only applicable if the charge was created using the `destination` parameter).


  **:source_transfer** :: *ExOAPI.Stripe.Schemas.Transfer | :string*

  The transfer ID which created this charge. Only present if the charge came from another Stripe account. [See the Connect documentation](https://stripe.com/docs/connect/destination-charges) for details.


  **:status** :: *:string*

  The status of the payment is either `succeeded`, `pending`, or `failed`.


  **:transfer_group** :: *:string*

  A string that identifies this transaction as part of a group. See the [Connect documentation](https://stripe.com/docs/connect/charges-transfers#transfer-options) for details.


  **:disputed** :: *:boolean*

  Whether the charge has been disputed.


  **:application_fee_amount** :: *:integer*

  The amount of the application fee (if any) requested for the charge. [See the Connect documentation](https://stripe.com/docs/connect/direct-charges#collecting-fees) for details.


  **:statement_descriptor_suffix** :: *:string*

  Provides information about the charge that customers see on their statements. Concatenated with the prefix (shortened descriptor) or statement descriptor that’s set on the account to form the complete statement descriptor. Maximum 22 characters for the concatenated descriptor.


  **:transfer_data** :: *ExOAPI.Stripe.Schemas.ChargeTransferData*

  An optional dictionary including the account to automatically transfer to as part of a destination charge. [See the Connect documentation](https://stripe.com/docs/connect/destination-charges) for details.


  **:id** :: *:string*

  Unique identifier for the object.


  **:shipping** :: *ExOAPI.Stripe.Schemas.Shipping*

  Shipping information for the charge.


  """

  @primary_key false
  typed_embedded_schema do
    field(:receipt_url, :string)

    field(:payment_method, :string)

    field(:livemode, :boolean)

    field(:calculated_statement_descriptor, :string)

    field(:metadata, :map)

    field(:description, :string)

    field(:paid, :boolean)

    field(:application_fee, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.ApplicationFee]
    )

    field(:failure_message, :string)

    field(:review, ExOAPI.EctoTypes.AnyOf, types: [:string, ExOAPI.Stripe.Schemas.Review])

    field(:payment_intent, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.PaymentIntent]
    )

    field(:refunds, :map)

    field(:on_behalf_of, ExOAPI.EctoTypes.AnyOf, types: [:string, ExOAPI.Stripe.Schemas.Account])

    field(:customer, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.Customer, ExOAPI.Stripe.Schemas.DeletedCustomer]
    )

    field(:fraud_details, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.ChargeFraudDetails]
    )

    field(:amount, :integer)

    field(:outcome, ExOAPI.EctoTypes.AnyOf, types: [ExOAPI.Stripe.Schemas.ChargeOutcome])

    field(:invoice, ExOAPI.EctoTypes.AnyOf, types: [:string, ExOAPI.Stripe.Schemas.Invoice])

    field(:payment_method_details, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.PaymentMethodDetails]
    )

    field(:statement_descriptor, :string)

    field(:balance_transaction, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.BalanceTransaction]
    )

    field(:application, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.Application]
    )

    field(:receipt_email, :string)

    field(:failure_balance_transaction, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.BalanceTransaction]
    )

    field(:receipt_number, :string)

    field(:failure_code, :string)

    field(:object, Ecto.Enum, values: [:charge])

    field(:amount_captured, :integer)

    field(:order, ExOAPI.EctoTypes.AnyOf, types: [:string, ExOAPI.Stripe.Schemas.Order])

    embeds_one(:billing_details, ExOAPI.Stripe.Schemas.BillingDetails)

    field(:captured, :boolean)

    field(:amount_refunded, :integer)

    field(:refunded, :boolean)

    field(:currency, :string)

    field(:created, :integer)

    field(:transfer, ExOAPI.EctoTypes.AnyOf, types: [:string, ExOAPI.Stripe.Schemas.Transfer])

    field(:source_transfer, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.Transfer]
    )

    field(:status, Ecto.Enum, values: [:succeeded, :pending, :failed])

    field(:transfer_group, :string)

    field(:disputed, :boolean)

    field(:application_fee_amount, :integer)

    field(:statement_descriptor_suffix, :string)

    field(:transfer_data, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.ChargeTransferData]
    )

    field(:id, :string)

    field(:shipping, ExOAPI.EctoTypes.AnyOf, types: [ExOAPI.Stripe.Schemas.Shipping])
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :shipping,
      :id,
      :transfer_data,
      :statement_descriptor_suffix,
      :application_fee_amount,
      :disputed,
      :transfer_group,
      :status,
      :source_transfer,
      :transfer,
      :created,
      :currency,
      :refunded,
      :amount_refunded,
      :captured,
      :order,
      :amount_captured,
      :object,
      :failure_code,
      :receipt_number,
      :failure_balance_transaction,
      :receipt_email,
      :application,
      :balance_transaction,
      :statement_descriptor,
      :payment_method_details,
      :invoice,
      :outcome,
      :amount,
      :fraud_details,
      :customer,
      :on_behalf_of,
      :refunds,
      :payment_intent,
      :review,
      :failure_message,
      :application_fee,
      :paid,
      :description,
      :metadata,
      :calculated_statement_descriptor,
      :livemode,
      :payment_method,
      :receipt_url
    ])
    |> validate_required([
      :id,
      :disputed,
      :status,
      :created,
      :currency,
      :refunded,
      :amount_refunded,
      :captured,
      :amount_captured,
      :object,
      :amount,
      :refunds,
      :paid,
      :metadata,
      :livemode
    ])
    |> cast_embed(:billing_details, required: true)
  end
end