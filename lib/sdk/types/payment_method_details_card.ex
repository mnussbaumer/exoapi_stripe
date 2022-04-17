defmodule ExOAPI.Stripe.Schemas.PaymentMethodDetailsCard do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:brand** :: *:string*

  Card brand. Can be `amex`, `diners`, `discover`, `jcb`, `mastercard`, `unionpay`, `visa`, or `unknown`.


  **:checks** :: *ExOAPI.Stripe.Schemas.PaymentMethodDetailsCardChecks*

  Check results by Card networks on Card address and CVC at time of payment.


  **:country** :: *:string*

  Two-letter ISO code representing the country of the card. You could use this attribute to get a sense of the international breakdown of cards you've collected.


  **:exp_month** :: *:integer*

  Two-digit number representing the card's expiration month.


  **:exp_year** :: *:integer*

  Four-digit number representing the card's expiration year.


  **:fingerprint** :: *:string*

  Uniquely identifies this particular card number. You can use this attribute to check whether two customers who’ve signed up with you are using the same card number, for example. For payment methods that tokenize card information (Apple Pay, Google Pay), the tokenized number might be provided instead of the underlying card number.

  *Starting May 1, 2021, card fingerprint in India for Connect will change to allow two fingerprints for the same card --- one for India and one for the rest of the world.*


  **:funding** :: *:string*

  Card funding type. Can be `credit`, `debit`, `prepaid`, or `unknown`.


  **:installments** :: *ExOAPI.Stripe.Schemas.PaymentMethodDetailsCardInstallments*

  Installment details for this payment (Mexico only).

  For more information, see the [installments integration guide](https://stripe.com/docs/payments/installments).


  **:last4** :: *:string*

  The last four digits of the card.


  **:mandate** :: *ExOAPI.Stripe.Schemas.Mandate*

  ID of the mandate used to make this payment or created by it.


  **:network** :: *:string*

  Identifies which network this charge was processed on. Can be `amex`, `cartes_bancaires`, `diners`, `discover`, `interac`, `jcb`, `mastercard`, `unionpay`, `visa`, or `unknown`.


  **:three_d_secure** :: *ExOAPI.Stripe.Schemas.ThreeDSecureDetails*

  Populated if this transaction used 3D Secure authentication.


  **:wallet** :: *ExOAPI.Stripe.Schemas.PaymentMethodDetailsCardWallet*

  If this Card is part of a card wallet, this contains the details of the card wallet.


  """

  @primary_key false
  typed_embedded_schema do
    field(:brand, :string)

    field(:checks, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.PaymentMethodDetailsCardChecks]
    )

    field(:country, :string)

    field(:exp_month, :integer)

    field(:exp_year, :integer)

    field(:fingerprint, :string)

    field(:funding, :string)

    field(:installments, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.PaymentMethodDetailsCardInstallments]
    )

    field(:last4, :string)

    field(:mandate, :string)

    field(:network, :string)

    field(:three_d_secure, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.ThreeDSecureDetails]
    )

    field(:wallet, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.PaymentMethodDetailsCardWallet]
    )
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :wallet,
      :three_d_secure,
      :network,
      :mandate,
      :last4,
      :installments,
      :funding,
      :fingerprint,
      :exp_year,
      :exp_month,
      :country,
      :checks,
      :brand
    ])
    |> validate_required([:exp_year, :exp_month])
  end
end