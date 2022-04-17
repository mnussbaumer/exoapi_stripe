defmodule ExOAPI.Stripe.Schemas.PaymentMethodCard do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:brand** :: *:string*

  Card brand. Can be `amex`, `diners`, `discover`, `jcb`, `mastercard`, `unionpay`, `visa`, or `unknown`.


  **:checks** :: *ExOAPI.Stripe.Schemas.PaymentMethodCardChecks*

  Checks on Card address and CVC if provided.


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


  **:generated_from** :: *ExOAPI.Stripe.Schemas.PaymentMethodCardGeneratedCard*

  Details of the original PaymentMethod that created this object.


  **:last4** :: *:string*

  The last four digits of the card.


  **:networks** :: *ExOAPI.Stripe.Schemas.Networks*

  Contains information about card networks that can be used to process the payment.


  **:three_d_secure_usage** :: *ExOAPI.Stripe.Schemas.ThreeDSecureUsage*

  Contains details on how this Card maybe be used for 3D Secure authentication.


  **:wallet** :: *ExOAPI.Stripe.Schemas.PaymentMethodCardWallet*

  If this Card is part of a card wallet, this contains the details of the card wallet.


  """

  @primary_key false
  typed_embedded_schema do
    field(:brand, :string)

    field(:checks, ExOAPI.EctoTypes.AnyOf, types: [ExOAPI.Stripe.Schemas.PaymentMethodCardChecks])

    field(:country, :string)

    field(:exp_month, :integer)

    field(:exp_year, :integer)

    field(:fingerprint, :string)

    field(:funding, :string)

    field(:generated_from, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.PaymentMethodCardGeneratedCard]
    )

    field(:last4, :string)

    field(:networks, ExOAPI.EctoTypes.AnyOf, types: [ExOAPI.Stripe.Schemas.Networks])

    field(:three_d_secure_usage, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.ThreeDSecureUsage]
    )

    field(:wallet, ExOAPI.EctoTypes.AnyOf, types: [ExOAPI.Stripe.Schemas.PaymentMethodCardWallet])
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :wallet,
      :three_d_secure_usage,
      :networks,
      :last4,
      :generated_from,
      :funding,
      :fingerprint,
      :exp_year,
      :exp_month,
      :country,
      :checks,
      :brand
    ])
    |> validate_required([:last4, :funding, :exp_year, :exp_month, :brand])
  end
end