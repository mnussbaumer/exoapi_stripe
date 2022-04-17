defmodule ExOAPI.Stripe.Schemas.BalanceTransaction do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: Balance transactions represent funds moving through your Stripe account.
  They're created for every type of transaction that comes into or flows out of your Stripe account balance.

  Related guide: [Balance Transaction Types](https://stripe.com/docs/reports/balance-transaction-types).

  **:amount** :: *:integer*

  Gross amount of the transaction, in %s.


  **:available_on** :: *:integer*

  The date the transaction's net funds will become available in the Stripe balance.


  **:created** :: *:integer*

  Time at which the object was created. Measured in seconds since the Unix epoch.


  **:currency** :: *:string*

  Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).


  **:description** :: *:string*

  An arbitrary string attached to the object. Often useful for displaying to users.


  **:exchange_rate** :: *ExOAPI.Stripe.Schemas.ExchangeRate*

  The exchange rate used, if applicable, for this transaction. Specifically, if money was converted from currency A to currency B, then the `amount` in currency A, times `exchange_rate`, would be the `amount` in currency B. For example, suppose you charged a customer 10.00 EUR. Then the PaymentIntent's `amount` would be `1000` and `currency` would be `eur`. Suppose this was converted into 12.34 USD in your Stripe account. Then the BalanceTransaction's `amount` would be `1234`, `currency` would be `usd`, and `exchange_rate` would be `1.234`.


  **:fee** :: *ExOAPI.Stripe.Schemas.Fee*

  Fees (in %s) paid for this transaction.


  **::fee_details** :: *ExOAPI.Stripe.Schemas.Fee*


  **:id** :: *:string*

  Unique identifier for the object.


  **:net** :: *:integer*

  Net amount of the transaction, in %s.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  **:reporting_category** :: *:string*

  [Learn more](https://stripe.com/docs/reports/reporting-categories) about how reporting categories can help you understand balance transactions from an accounting perspective.


  **:source** :: *ExOAPI.Stripe.Schemas.TransferReversal | ExOAPI.Stripe.Schemas.Transfer | ExOAPI.Stripe.Schemas.Topup | ExOAPI.Stripe.Schemas.TaxDeductedAtSource | ExOAPI.Stripe.Schemas.ReserveTransaction | ExOAPI.Stripe.Schemas.Refund | ExOAPI.Stripe.Schemas.PlatformTaxFee | ExOAPI.Stripe.Schemas.Payout | ExOAPI.Stripe.Schemas.Issuing_transaction | ExOAPI.Stripe.Schemas.Issuing_dispute | ExOAPI.Stripe.Schemas.Issuing_authorization | ExOAPI.Stripe.Schemas.FeeRefund | ExOAPI.Stripe.Schemas.Dispute | ExOAPI.Stripe.Schemas.ConnectCollectionTransfer | ExOAPI.Stripe.Schemas.Charge | ExOAPI.Stripe.Schemas.ApplicationFee | :string*

  The Stripe object to which this transaction is related.


  **:status** :: *:string*

  If the transaction's net funds are available in the Stripe balance yet. Either `available` or `pending`.


  **:type** :: *:string*

  Transaction type: `adjustment`, `advance`, `advance_funding`, `anticipation_repayment`, `application_fee`, `application_fee_refund`, `charge`, `connect_collection_transfer`, `contribution`, `issuing_authorization_hold`, `issuing_authorization_release`, `issuing_dispute`, `issuing_transaction`, `payment`, `payment_failure_refund`, `payment_refund`, `payout`, `payout_cancel`, `payout_failure`, `refund`, `refund_failure`, `reserve_transaction`, `reserved_funds`, `stripe_fee`, `stripe_fx_fee`, `tax_fee`, `topup`, `topup_reversal`, `transfer`, `transfer_cancel`, `transfer_failure`, or `transfer_refund`. [Learn more](https://stripe.com/docs/reports/balance-transaction-types) about balance transaction types and what they represent. If you are looking to classify transactions for accounting purposes, you might want to consider `reporting_category` instead.


  """

  @primary_key false
  typed_embedded_schema do
    field(:amount, :integer)

    field(:available_on, :integer)

    field(:created, :integer)

    field(:currency, :string)

    field(:description, :string)

    field(:exchange_rate, :float)

    field(:fee, :integer)

    embeds_many(:fee_details, ExOAPI.Stripe.Schemas.Fee)

    field(:id, :string)

    field(:net, :integer)

    field(:object, Ecto.Enum, values: [:balance_transaction])

    field(:reporting_category, :string)

    field(:source, ExOAPI.EctoTypes.AnyOf,
      types: [
        :string,
        ExOAPI.Stripe.Schemas.ApplicationFee,
        ExOAPI.Stripe.Schemas.Charge,
        ExOAPI.Stripe.Schemas.ConnectCollectionTransfer,
        ExOAPI.Stripe.Schemas.Dispute,
        ExOAPI.Stripe.Schemas.FeeRefund,
        ExOAPI.Stripe.Schemas.Issuing_authorization,
        ExOAPI.Stripe.Schemas.Issuing_dispute,
        ExOAPI.Stripe.Schemas.Issuing_transaction,
        ExOAPI.Stripe.Schemas.Payout,
        ExOAPI.Stripe.Schemas.PlatformTaxFee,
        ExOAPI.Stripe.Schemas.Refund,
        ExOAPI.Stripe.Schemas.ReserveTransaction,
        ExOAPI.Stripe.Schemas.TaxDeductedAtSource,
        ExOAPI.Stripe.Schemas.Topup,
        ExOAPI.Stripe.Schemas.Transfer,
        ExOAPI.Stripe.Schemas.TransferReversal
      ]
    )

    field(:status, :string)

    field(:type, Ecto.Enum,
      values: [
        :transfer_refund,
        :transfer_failure,
        :transfer_cancel,
        :transfer,
        :topup_reversal,
        :topup,
        :tax_fee,
        :stripe_fx_fee,
        :stripe_fee,
        :reserved_funds,
        :reserve_transaction,
        :refund_failure,
        :refund,
        :payout_failure,
        :payout_cancel,
        :payout,
        :payment_refund,
        :payment_failure_refund,
        :payment,
        :issuing_transaction,
        :issuing_dispute,
        :issuing_authorization_release,
        :issuing_authorization_hold,
        :contribution,
        :connect_collection_transfer,
        :charge,
        :application_fee_refund,
        :application_fee,
        :anticipation_repayment,
        :advance_funding,
        :advance,
        :adjustment
      ]
    )
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :type,
      :status,
      :source,
      :reporting_category,
      :object,
      :net,
      :id,
      :fee,
      :exchange_rate,
      :description,
      :currency,
      :created,
      :available_on,
      :amount
    ])
    |> validate_required([
      :type,
      :status,
      :reporting_category,
      :object,
      :net,
      :id,
      :fee,
      :currency,
      :created,
      :available_on,
      :amount
    ])
    |> cast_embed(:fee_details, required: true)
  end
end