defmodule ExOAPI.Stripe.Schemas.Card do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: You can store multiple cards on a customer in order to charge the customer
  later. You can also store multiple debit cards on a recipient in order to
  transfer to those cards later.

  Related guide: [Card Payments with Sources](https://stripe.com/docs/sources/cards).

  **:account** :: *ExOAPI.Stripe.Schemas.Account | :string*

  The account this card belongs to. This attribute will not be in the card object if the card belongs to a customer or recipient instead.


  **:address_city** :: *:string*

  City/District/Suburb/Town/Village.


  **:address_country** :: *:string*

  Billing address country, if provided when creating card.


  **:address_line1** :: *:string*

  Address line 1 (Street address/PO Box/Company name).


  **:address_line1_check** :: *:string*

  If `address_line1` was provided, results of the check: `pass`, `fail`, `unavailable`, or `unchecked`.


  **:address_line2** :: *:string*

  Address line 2 (Apartment/Suite/Unit/Building).


  **:address_state** :: *:string*

  State/County/Province/Region.


  **:address_zip** :: *:string*

  ZIP or postal code.


  **:address_zip_check** :: *:string*

  If `address_zip` was provided, results of the check: `pass`, `fail`, `unavailable`, or `unchecked`.


  **::available_payout_methods** :: *:string*


  **:brand** :: *:string*

  Card brand. Can be `American Express`, `Diners Club`, `Discover`, `JCB`, `MasterCard`, `UnionPay`, `Visa`, or `Unknown`.


  **:country** :: *:string*

  Two-letter ISO code representing the country of the card. You could use this attribute to get a sense of the international breakdown of cards you've collected.


  **:currency** :: *:string*

  Three-letter [ISO code for currency](https://stripe.com/docs/payouts). Only applicable on accounts (not customers or recipients). The card can be used as a transfer destination for funds in this currency.


  **:customer** :: *ExOAPI.Stripe.Schemas.DeletedCustomer | ExOAPI.Stripe.Schemas.Customer | :string*

  The customer that this card belongs to. This attribute will not be in the card object if the card belongs to an account or recipient instead.


  **:cvc_check** :: *:string*

  If a CVC was provided, results of the check: `pass`, `fail`, `unavailable`, or `unchecked`. A result of unchecked indicates that CVC was provided but hasn't been checked yet. Checks are typically performed when attaching a card to a Customer object, or when creating a charge. For more details, see [Check if a card is valid without a charge](https://support.stripe.com/questions/check-if-a-card-is-valid-without-a-charge).


  **:default_for_currency** :: *:boolean*

  Whether this card is the default external account for its currency.


  **:dynamic_last4** :: *:string*

  (For tokenized numbers only.) The last four digits of the device account number.


  **:exp_month** :: *:integer*

  Two-digit number representing the card's expiration month.


  **:exp_year** :: *:integer*

  Four-digit number representing the card's expiration year.


  **:fingerprint** :: *:string*

  Uniquely identifies this particular card number. You can use this attribute to check whether two customers who’ve signed up with you are using the same card number, for example. For payment methods that tokenize card information (Apple Pay, Google Pay), the tokenized number might be provided instead of the underlying card number.

  *Starting May 1, 2021, card fingerprint in India for Connect will change to allow two fingerprints for the same card --- one for India and one for the rest of the world.*


  **:funding** :: *:string*

  Card funding type. Can be `credit`, `debit`, `prepaid`, or `unknown`.


  **:id** :: *:string*

  Unique identifier for the object.


  **:last4** :: *:string*

  The last four digits of the card.


  **:metadata** :: *:map*

  Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.


  **:name** :: *:string*

  Cardholder name.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  **:recipient** :: *ExOAPI.Stripe.Schemas.Recipient | :string*

  The recipient that this card belongs to. This attribute will not be in the card object if the card belongs to a customer or account instead.


  **:status** :: *:string*

  For external accounts, possible values are `new` and `errored`. If a transfer fails, the status is set to `errored` and transfers are stopped until account details are updated.


  **:tokenization_method** :: *:string*

  If the card number is tokenized, this is the method that was used. Can be `android_pay` (includes Google Pay), `apple_pay`, `masterpass`, `visa_checkout`, or null.


  """

  @primary_key false
  typed_embedded_schema do
    field(:account, ExOAPI.EctoTypes.AnyOf, types: [:string, ExOAPI.Stripe.Schemas.Account])

    field(:address_city, :string)

    field(:address_country, :string)

    field(:address_line1, :string)

    field(:address_line1_check, :string)

    field(:address_line2, :string)

    field(:address_state, :string)

    field(:address_zip, :string)

    field(:address_zip_check, :string)

    field(:available_payout_methods, {:array, :string})

    field(:brand, :string)

    field(:country, :string)

    field(:currency, :string)

    field(:customer, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.Customer, ExOAPI.Stripe.Schemas.DeletedCustomer]
    )

    field(:cvc_check, :string)

    field(:default_for_currency, :boolean)

    field(:dynamic_last4, :string)

    field(:exp_month, :integer)

    field(:exp_year, :integer)

    field(:fingerprint, :string)

    field(:funding, :string)

    field(:id, :string)

    field(:last4, :string)

    field(:metadata, :map)

    field(:name, :string)

    field(:object, Ecto.Enum, values: [:card])

    field(:recipient, ExOAPI.EctoTypes.AnyOf, types: [:string, ExOAPI.Stripe.Schemas.Recipient])

    field(:status, :string)

    field(:tokenization_method, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :tokenization_method,
      :status,
      :recipient,
      :object,
      :name,
      :metadata,
      :last4,
      :id,
      :funding,
      :fingerprint,
      :exp_year,
      :exp_month,
      :dynamic_last4,
      :default_for_currency,
      :cvc_check,
      :customer,
      :currency,
      :country,
      :brand,
      :available_payout_methods,
      :address_zip_check,
      :address_zip,
      :address_state,
      :address_line2,
      :address_line1_check,
      :address_line1,
      :address_country,
      :address_city,
      :account
    ])
    |> validate_required([:object, :last4, :id, :funding, :exp_year, :exp_month, :brand])
  end
end