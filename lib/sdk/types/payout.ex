defmodule ExOAPI.Stripe.Schemas.Payout do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: A `Payout` object is created when you receive funds from Stripe, or when you
  initiate a payout to either a bank account or debit card of a [connected
  Stripe account](/docs/connect/bank-debit-card-payouts). You can retrieve individual payouts,
  as well as list all payouts. Payouts are made on [varying
  schedules](/docs/connect/manage-payout-schedule), depending on your country and
  industry.

  Related guide: [Receiving Payouts](https://stripe.com/docs/payouts).

  **:amount** :: *:integer*

  Amount (in %s) to be transferred to your bank account or debit card.


  **:arrival_date** :: *:integer*

  Date the payout is expected to arrive in the bank. This factors in delays like weekends or bank holidays.


  **:automatic** :: *:boolean*

  Returns `true` if the payout was created by an [automated payout schedule](https://stripe.com/docs/payouts#payout-schedule), and `false` if it was [requested manually](https://stripe.com/docs/payouts#manual-payouts).


  **:balance_transaction** :: *ExOAPI.Stripe.Schemas.BalanceTransaction | :string*

  ID of the balance transaction that describes the impact of this payout on your account balance.


  **:created** :: *:integer*

  Time at which the object was created. Measured in seconds since the Unix epoch.


  **:currency** :: *:string*

  Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).


  **:description** :: *:string*

  An arbitrary string attached to the object. Often useful for displaying to users.


  **:destination** :: *ExOAPI.Stripe.Schemas.DeletedCard | ExOAPI.Stripe.Schemas.DeletedBankAccount | ExOAPI.Stripe.Schemas.Card | ExOAPI.Stripe.Schemas.BankAccount | :string*

  ID of the bank account or card the payout was sent to.


  **:failure_balance_transaction** :: *ExOAPI.Stripe.Schemas.BalanceTransaction | :string*

  If the payout failed or was canceled, this will be the ID of the balance transaction that reversed the initial balance transaction, and puts the funds from the failed payout back in your balance.


  **:failure_code** :: *:string*

  Error code explaining reason for payout failure if available. See [Types of payout failures](https://stripe.com/docs/api#payout_failures) for a list of failure codes.


  **:failure_message** :: *:string*

  Message to user further explaining reason for payout failure if available.


  **:id** :: *:string*

  Unique identifier for the object.


  **:livemode** :: *:boolean*

  Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.


  **:metadata** :: *:map*

  Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.


  **:method** :: *:string*

  The method used to send this payout, which can be `standard` or `instant`. `instant` is only supported for payouts to debit cards. (See [Instant payouts for marketplaces](https://stripe.com/blog/instant-payouts-for-marketplaces) for more information.)


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  **:original_payout** :: *ExOAPI.Stripe.Schemas.Payout | :string*

  If the payout reverses another, this is the ID of the original payout.


  **:reversed_by** :: *ExOAPI.Stripe.Schemas.Payout | :string*

  If the payout was reversed, this is the ID of the payout that reverses this payout.


  **:source_type** :: *:string*

  The source balance this payout came from. One of `card`, `fpx`, or `bank_account`.


  **:statement_descriptor** :: *:string*

  Extra information about a payout to be displayed on the user's bank statement.


  **:status** :: *:string*

  Current status of the payout: `paid`, `pending`, `in_transit`, `canceled` or `failed`. A payout is `pending` until it is submitted to the bank, when it becomes `in_transit`. The status then changes to `paid` if the transaction goes through, or to `failed` or `canceled` (within 5 business days). Some failed payouts may initially show as `paid` but then change to `failed`.


  **:type** :: *:string*

  Can be `bank_account` or `card`.


  """

  @primary_key false
  typed_embedded_schema do
    field(:amount, :integer)

    field(:arrival_date, :integer)

    field(:automatic, :boolean)

    field(:balance_transaction, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.BalanceTransaction]
    )

    field(:created, :integer)

    field(:currency, :string)

    field(:description, :string)

    field(:destination, ExOAPI.EctoTypes.AnyOf,
      types: [
        :string,
        ExOAPI.Stripe.Schemas.BankAccount,
        ExOAPI.Stripe.Schemas.Card,
        ExOAPI.Stripe.Schemas.DeletedBankAccount,
        ExOAPI.Stripe.Schemas.DeletedCard
      ]
    )

    field(:failure_balance_transaction, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.BalanceTransaction]
    )

    field(:failure_code, :string)

    field(:failure_message, :string)

    field(:id, :string)

    field(:livemode, :boolean)

    field(:metadata, :map)

    field(:method, :string)

    field(:object, Ecto.Enum, values: [:payout])

    field(:original_payout, ExOAPI.EctoTypes.AnyOf, types: [:string, ExOAPI.Stripe.Schemas.Payout])

    field(:reversed_by, ExOAPI.EctoTypes.AnyOf, types: [:string, ExOAPI.Stripe.Schemas.Payout])

    field(:source_type, :string)

    field(:statement_descriptor, :string)

    field(:status, :string)

    field(:type, Ecto.Enum, values: [:card, :bank_account])
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :type,
      :status,
      :statement_descriptor,
      :source_type,
      :reversed_by,
      :original_payout,
      :object,
      :method,
      :metadata,
      :livemode,
      :id,
      :failure_message,
      :failure_code,
      :failure_balance_transaction,
      :destination,
      :description,
      :currency,
      :created,
      :balance_transaction,
      :automatic,
      :arrival_date,
      :amount
    ])
    |> validate_required([
      :type,
      :status,
      :source_type,
      :object,
      :method,
      :livemode,
      :id,
      :currency,
      :created,
      :automatic,
      :arrival_date,
      :amount
    ])
  end
end