defmodule ExOAPI.Stripe.Schemas.Issuing_authorization do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: When an [issued card](https://stripe.com/docs/issuing) is used to make a purchase, an Issuing `Authorization`
  object is created. [Authorizations](https://stripe.com/docs/issuing/purchases/authorizations) must be approved for the
  purchase to be completed successfully.

  Related guide: [Issued Card Authorizations](https://stripe.com/docs/issuing/purchases/authorizations).

  **:amount** :: *:integer*

  The total amount that was authorized or rejected. This amount is in the card's currency and in the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal).


  **:amount_details** :: *ExOAPI.Stripe.Schemas.IssuingAuthorizationAmountDetails*

  Detailed breakdown of amount components. These amounts are denominated in `currency` and in the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal).


  **:approved** :: *:boolean*

  Whether the authorization has been approved.


  **:authorization_method** :: *:string*

  How the card details were provided.


  **::balance_transactions** :: *ExOAPI.Stripe.Schemas.BalanceTransaction*


  **:card** :: *ExOAPI.Stripe.Schemas.Issuing_card*


  **:cardholder** :: *ExOAPI.Stripe.Schemas.Issuing_cardholder | :string*

  The cardholder to whom this authorization belongs.


  **:created** :: *:integer*

  Time at which the object was created. Measured in seconds since the Unix epoch.


  **:currency** :: *:string*

  Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).


  **:id** :: *:string*

  Unique identifier for the object.


  **:livemode** :: *:boolean*

  Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.


  **:merchant_amount** :: *:integer*

  The total amount that was authorized or rejected. This amount is in the `merchant_currency` and in the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal).


  **:merchant_currency** :: *:string*

  The currency that was presented to the cardholder for the authorization. Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).


  **:merchant_data** :: *ExOAPI.Stripe.Schemas.IssuingAuthorizationMerchantData*


  **:metadata** :: *:map*

  Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  **:pending_request** :: *ExOAPI.Stripe.Schemas.IssuingAuthorizationPendingRequest*

  The pending authorization request. This field will only be non-null during an `issuing_authorization.request` webhook.


  **::request_history** :: *ExOAPI.Stripe.Schemas.IssuingAuthorizationRequest*


  **:status** :: *:string*

  The current status of the authorization in its lifecycle.


  **::transactions** :: *ExOAPI.Stripe.Schemas.Issuing_transaction*


  **:verification_data** :: *ExOAPI.Stripe.Schemas.IssuingAuthorizationVerificationData*


  **:wallet** :: *:string*

  The digital wallet used for this authorization. One of `apple_pay`, `google_pay`, or `samsung_pay`.


  """

  @primary_key false
  typed_embedded_schema do
    field(:amount, :integer)

    field(:amount_details, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.IssuingAuthorizationAmountDetails]
    )

    field(:approved, :boolean)

    field(:authorization_method, Ecto.Enum,
      values: [:swipe, :online, :keyed_in, :contactless, :chip]
    )

    embeds_many(:balance_transactions, ExOAPI.Stripe.Schemas.BalanceTransaction)

    embeds_one(:card, ExOAPI.Stripe.Schemas.Issuing_card)

    field(:cardholder, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.Issuing_cardholder]
    )

    field(:created, :integer)

    field(:currency, :string)

    field(:id, :string)

    field(:livemode, :boolean)

    field(:merchant_amount, :integer)

    field(:merchant_currency, :string)

    embeds_one(:merchant_data, ExOAPI.Stripe.Schemas.IssuingAuthorizationMerchantData)

    field(:metadata, :map)

    field(:object, Ecto.Enum, values: [:"issuing.authorization"])

    field(:pending_request, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.IssuingAuthorizationPendingRequest]
    )

    embeds_many(:request_history, ExOAPI.Stripe.Schemas.IssuingAuthorizationRequest)

    field(:status, Ecto.Enum, values: [:reversed, :pending, :closed])

    embeds_many(:transactions, ExOAPI.Stripe.Schemas.Issuing_transaction)

    embeds_one(:verification_data, ExOAPI.Stripe.Schemas.IssuingAuthorizationVerificationData)

    field(:wallet, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :wallet,
      :status,
      :pending_request,
      :object,
      :metadata,
      :merchant_currency,
      :merchant_amount,
      :livemode,
      :id,
      :currency,
      :created,
      :cardholder,
      :authorization_method,
      :approved,
      :amount_details,
      :amount
    ])
    |> validate_required([
      :status,
      :object,
      :metadata,
      :merchant_currency,
      :merchant_amount,
      :livemode,
      :id,
      :currency,
      :created,
      :authorization_method,
      :approved,
      :amount
    ])
    |> cast_embed(:verification_data, required: true)
    |> cast_embed(:transactions, required: true)
    |> cast_embed(:request_history, required: true)
    |> cast_embed(:merchant_data, required: true)
    |> cast_embed(:card, required: true)
    |> cast_embed(:balance_transactions, required: true)
  end
end