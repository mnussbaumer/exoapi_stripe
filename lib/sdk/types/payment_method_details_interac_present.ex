defmodule ExOAPI.Stripe.Schemas.PaymentMethodDetailsInteracPresent do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:brand** :: *:string*

  Card brand. Can be `interac`, `mastercard` or `visa`.


  **:cardholder_name** :: *:string*

  The cardholder name as read from the card, in [ISO 7813](https://en.wikipedia.org/wiki/ISO/IEC_7813) format. May include alphanumeric characters, special characters and first/last name separator (`/`). In some cases, the cardholder name may not be available depending on how the issuer has configured the card. Cardholder name is typically not available on swipe or contactless payments, such as those made with Apple Pay and Google Pay.


  **:country** :: *:string*

  Two-letter ISO code representing the country of the card. You could use this attribute to get a sense of the international breakdown of cards you've collected.


  **:emv_auth_data** :: *:string*

  Authorization response cryptogram.


  **:exp_month** :: *:integer*

  Two-digit number representing the card's expiration month.


  **:exp_year** :: *:integer*

  Four-digit number representing the card's expiration year.


  **:fingerprint** :: *:string*

  Uniquely identifies this particular card number. You can use this attribute to check whether two customers who’ve signed up with you are using the same card number, for example. For payment methods that tokenize card information (Apple Pay, Google Pay), the tokenized number might be provided instead of the underlying card number.

  *Starting May 1, 2021, card fingerprint in India for Connect will change to allow two fingerprints for the same card --- one for India and one for the rest of the world.*


  **:funding** :: *:string*

  Card funding type. Can be `credit`, `debit`, `prepaid`, or `unknown`.


  **:generated_card** :: *:string*

  ID of a card PaymentMethod generated from the card_present PaymentMethod that may be attached to a Customer for future transactions. Only present if it was possible to generate a card PaymentMethod.


  **:last4** :: *:string*

  The last four digits of the card.


  **:network** :: *:string*

  Identifies which network this charge was processed on. Can be `amex`, `cartes_bancaires`, `diners`, `discover`, `interac`, `jcb`, `mastercard`, `unionpay`, `visa`, or `unknown`.


  **::preferred_locales** :: *:string*


  **:read_method** :: *:string*

  How card details were read in this transaction.


  **:receipt** :: *ExOAPI.Stripe.Schemas.PaymentMethodDetailsInteracPresentReceipt*

  A collection of fields required to be displayed on receipts. Only required for EMV transactions.


  """

  @primary_key false
  typed_embedded_schema do
    field(:brand, :string)

    field(:cardholder_name, :string)

    field(:country, :string)

    field(:emv_auth_data, :string)

    field(:exp_month, :integer)

    field(:exp_year, :integer)

    field(:fingerprint, :string)

    field(:funding, :string)

    field(:generated_card, :string)

    field(:last4, :string)

    field(:network, :string)

    field(:preferred_locales, {:array, :string})

    field(:read_method, Ecto.Enum,
      values: [
        :magnetic_stripe_track2,
        :magnetic_stripe_fallback,
        :contactless_magstripe_mode,
        :contactless_emv,
        :contact_emv
      ]
    )

    field(:receipt, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.PaymentMethodDetailsInteracPresentReceipt]
    )
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :receipt,
      :read_method,
      :preferred_locales,
      :network,
      :last4,
      :generated_card,
      :funding,
      :fingerprint,
      :exp_year,
      :exp_month,
      :emv_auth_data,
      :country,
      :cardholder_name,
      :brand
    ])
    |> validate_required([:exp_year, :exp_month])
  end
end