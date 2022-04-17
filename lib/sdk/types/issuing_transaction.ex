defmodule ExOAPI.Stripe.Schemas.Issuing_transaction do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: Any use of an [issued card](https://stripe.com/docs/issuing) that results in funds entering or leaving
  your Stripe account, such as a completed purchase or refund, is represented by an Issuing
  `Transaction` object.

  Related guide: [Issued Card Transactions](https://stripe.com/docs/issuing/purchases/transactions).

  **:amount** :: *:integer*

  The transaction amount, which will be reflected in your balance. This amount is in your currency and in the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal).


  **:amount_details** :: *ExOAPI.Stripe.Schemas.IssuingTransactionAmountDetails*

  Detailed breakdown of amount components. These amounts are denominated in `currency` and in the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal).


  **:authorization** :: *ExOAPI.Stripe.Schemas.Issuing_authorization | :string*

  The `Authorization` object that led to this transaction.


  **:balance_transaction** :: *ExOAPI.Stripe.Schemas.BalanceTransaction | :string*

  ID of the [balance transaction](https://stripe.com/docs/api/balance_transactions) associated with this transaction.


  **:card** :: *ExOAPI.Stripe.Schemas.Issuing_card | :string*

  The card used to make this transaction.


  **:cardholder** :: *ExOAPI.Stripe.Schemas.Issuing_cardholder | :string*

  The cardholder to whom this transaction belongs.


  **:created** :: *:integer*

  Time at which the object was created. Measured in seconds since the Unix epoch.


  **:currency** :: *:string*

  Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).


  **:dispute** :: *ExOAPI.Stripe.Schemas.Issuing_dispute | :string*

  If you've disputed the transaction, the ID of the dispute.


  **:id** :: *:string*

  Unique identifier for the object.


  **:livemode** :: *:boolean*

  Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.


  **:merchant_amount** :: *:integer*

  The amount that the merchant will receive, denominated in `merchant_currency` and in the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal). It will be different from `amount` if the merchant is taking payment in a different currency.


  **:merchant_currency** :: *:string*

  The currency with which the merchant is taking payment.


  **:merchant_data** :: *ExOAPI.Stripe.Schemas.IssuingAuthorizationMerchantData*


  **:metadata** :: *:map*

  Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  **:purchase_details** :: *ExOAPI.Stripe.Schemas.IssuingTransactionPurchaseDetails*

  Additional purchase information that is optionally provided by the merchant.


  **:type** :: *:string*

  The nature of the transaction.


  **:wallet** :: *:string*

  The digital wallet used for this transaction. One of `apple_pay`, `google_pay`, or `samsung_pay`.


  """

  @primary_key false
  typed_embedded_schema do
    field(:amount, :integer)

    field(:amount_details, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.IssuingTransactionAmountDetails]
    )

    field(:authorization, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.Issuing_authorization]
    )

    field(:balance_transaction, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.BalanceTransaction]
    )

    field(:card, ExOAPI.EctoTypes.AnyOf, types: [:string, ExOAPI.Stripe.Schemas.Issuing_card])

    field(:cardholder, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.Issuing_cardholder]
    )

    field(:created, :integer)

    field(:currency, :string)

    field(:dispute, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.Issuing_dispute]
    )

    field(:id, :string)

    field(:livemode, :boolean)

    field(:merchant_amount, :integer)

    field(:merchant_currency, :string)

    embeds_one(:merchant_data, ExOAPI.Stripe.Schemas.IssuingAuthorizationMerchantData)

    field(:metadata, :map)

    field(:object, Ecto.Enum, values: [:"issuing.transaction"])

    field(:purchase_details, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.IssuingTransactionPurchaseDetails]
    )

    field(:type, Ecto.Enum, values: [:refund, :capture])

    field(:wallet, Ecto.Enum, values: [:samsung_pay, :google_pay, :apple_pay])
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :wallet,
      :type,
      :purchase_details,
      :object,
      :metadata,
      :merchant_currency,
      :merchant_amount,
      :livemode,
      :id,
      :dispute,
      :currency,
      :created,
      :cardholder,
      :card,
      :balance_transaction,
      :authorization,
      :amount_details,
      :amount
    ])
    |> validate_required([
      :type,
      :object,
      :metadata,
      :merchant_currency,
      :merchant_amount,
      :livemode,
      :id,
      :currency,
      :created,
      :card,
      :amount
    ])
    |> cast_embed(:merchant_data, required: true)
  end
end