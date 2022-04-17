defmodule ExOAPI.Stripe.Schemas.IssuingAuthorizationRequest do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:amount** :: *:integer*

  The `pending_request.amount` at the time of the request, presented in your card's currency and in the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal). Stripe held this amount from your account to fund the authorization if the request was approved.


  **:amount_details** :: *ExOAPI.Stripe.Schemas.IssuingAuthorizationAmountDetails*

  Detailed breakdown of amount components. These amounts are denominated in `currency` and in the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal).


  **:approved** :: *:boolean*

  Whether this request was approved.


  **:created** :: *:integer*

  Time at which the object was created. Measured in seconds since the Unix epoch.


  **:currency** :: *:string*

  Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).


  **:merchant_amount** :: *:integer*

  The `pending_request.merchant_amount` at the time of the request, presented in the `merchant_currency` and in the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal).


  **:merchant_currency** :: *:string*

  The currency that was collected by the merchant and presented to the cardholder for the authorization. Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).


  **:reason** :: *:string*

  The reason for the approval or decline.


  """

  @primary_key false
  typed_embedded_schema do
    field(:amount, :integer)

    field(:amount_details, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.IssuingAuthorizationAmountDetails]
    )

    field(:approved, :boolean)

    field(:created, :integer)

    field(:currency, :string)

    field(:merchant_amount, :integer)

    field(:merchant_currency, :string)

    field(:reason, Ecto.Enum,
      values: [
        :webhook_timeout,
        :webhook_declined,
        :webhook_approved,
        :verification_failed,
        :suspected_fraud,
        :spending_controls,
        :not_allowed,
        :insufficient_funds,
        :cardholder_verification_required,
        :cardholder_inactive,
        :card_inactive,
        :card_active,
        :account_disabled
      ]
    )
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :reason,
      :merchant_currency,
      :merchant_amount,
      :currency,
      :created,
      :approved,
      :amount_details,
      :amount
    ])
    |> validate_required([
      :reason,
      :merchant_currency,
      :merchant_amount,
      :currency,
      :created,
      :approved,
      :amount
    ])
  end
end