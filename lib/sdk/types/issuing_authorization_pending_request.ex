defmodule ExOAPI.Stripe.Schemas.IssuingAuthorizationPendingRequest do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:amount** :: *:integer*

  The additional amount Stripe will hold if the authorization is approved, in the card's [currency](https://stripe.com/docs/api#issuing_authorization_object-pending-request-currency) and in the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal).


  **:amount_details** :: *ExOAPI.Stripe.Schemas.IssuingAuthorizationAmountDetails*

  Detailed breakdown of amount components. These amounts are denominated in `currency` and in the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal).


  **:currency** :: *:string*

  Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).


  **:is_amount_controllable** :: *:boolean*

  If set `true`, you may provide [amount](https://stripe.com/docs/api/issuing/authorizations/approve#approve_issuing_authorization-amount) to control how much to hold for the authorization.


  **:merchant_amount** :: *:integer*

  The amount the merchant is requesting to be authorized in the `merchant_currency`. The amount is in the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal).


  **:merchant_currency** :: *:string*

  The local currency the merchant is requesting to authorize.


  """

  @primary_key false
  typed_embedded_schema do
    field(:amount, :integer)

    field(:amount_details, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.IssuingAuthorizationAmountDetails]
    )

    field(:currency, :string)

    field(:is_amount_controllable, :boolean)

    field(:merchant_amount, :integer)

    field(:merchant_currency, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :merchant_currency,
      :merchant_amount,
      :is_amount_controllable,
      :currency,
      :amount_details,
      :amount
    ])
    |> validate_required([
      :merchant_currency,
      :merchant_amount,
      :is_amount_controllable,
      :currency,
      :amount
    ])
  end
end