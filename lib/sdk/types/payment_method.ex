defmodule ExOAPI.Stripe.Schemas.PaymentMethod do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: PaymentMethod objects represent your customer's payment instruments.
  You can use them with [PaymentIntents](https://stripe.com/docs/payments/payment-intents) to collect payments or save them to
  Customer objects to store instrument details for future payments.

  Related guides: [Payment Methods](https://stripe.com/docs/payments/payment-methods) and [More Payment Scenarios](https://stripe.com/docs/payments/more-payment-scenarios).

  **:fpx** :: *ExOAPI.Stripe.Schemas.PaymentMethodFpx*


  **:livemode** :: *:boolean*

  Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.


  **:acss_debit** :: *ExOAPI.Stripe.Schemas.PaymentMethodAcssDebit*


  **:bacs_debit** :: *ExOAPI.Stripe.Schemas.PaymentMethodBacsDebit*


  **:alipay** :: *list(:map)*


  **:giropay** :: *list(:map)*


  **:ideal** :: *ExOAPI.Stripe.Schemas.PaymentMethodIdeal*


  **:card** :: *ExOAPI.Stripe.Schemas.PaymentMethodCard*


  **:metadata** :: *:map*

  Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.


  **:oxxo** :: *list(:map)*


  **:interac_present** :: *list(:map)*


  **:customer** :: *ExOAPI.Stripe.Schemas.Customer | :string*

  The ID of the Customer to which this PaymentMethod is saved. This will not be set when the PaymentMethod has not been saved to a Customer.


  **:us_bank_account** :: *ExOAPI.Stripe.Schemas.PaymentMethodUsBankAccount*


  **:boleto** :: *ExOAPI.Stripe.Schemas.PaymentMethodBoleto*


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  **:konbini** :: *list(:map)*


  **:billing_details** :: *ExOAPI.Stripe.Schemas.BillingDetails*


  **:wechat_pay** :: *list(:map)*


  **:sofort** :: *ExOAPI.Stripe.Schemas.PaymentMethodSofort*


  **:p24** :: *ExOAPI.Stripe.Schemas.PaymentMethodP24*


  **:created** :: *:integer*

  Time at which the object was created. Measured in seconds since the Unix epoch.


  **:afterpay_clearpay** :: *list(:map)*


  **:type** :: *:string*

  The type of the PaymentMethod. An additional hash is included on the PaymentMethod with a name matching this value. It contains additional information specific to the PaymentMethod type.


  **:grabpay** :: *list(:map)*


  **:bancontact** :: *list(:map)*


  **:au_becs_debit** :: *ExOAPI.Stripe.Schemas.PaymentMethodAuBecsDebit*


  **:customer_balance** :: *list(:map)*


  **:card_present** :: *list(:map)*


  **:sepa_debit** :: *ExOAPI.Stripe.Schemas.PaymentMethodSepaDebit*


  **:klarna** :: *ExOAPI.Stripe.Schemas.PaymentMethodKlarna*


  **:paynow** :: *list(:map)*


  **:id** :: *:string*

  Unique identifier for the object.


  **:eps** :: *ExOAPI.Stripe.Schemas.PaymentMethodEps*


  """

  @primary_key false
  typed_embedded_schema do
    embeds_one(:fpx, ExOAPI.Stripe.Schemas.PaymentMethodFpx)

    field(:livemode, :boolean)

    embeds_one(:acss_debit, ExOAPI.Stripe.Schemas.PaymentMethodAcssDebit)

    embeds_one(:bacs_debit, ExOAPI.Stripe.Schemas.PaymentMethodBacsDebit)

    field(:alipay, {:array, :map})

    field(:giropay, {:array, :map})

    embeds_one(:ideal, ExOAPI.Stripe.Schemas.PaymentMethodIdeal)

    embeds_one(:card, ExOAPI.Stripe.Schemas.PaymentMethodCard)

    field(:metadata, :map)

    field(:oxxo, {:array, :map})

    field(:interac_present, {:array, :map})

    field(:customer, ExOAPI.EctoTypes.AnyOf, types: [:string, ExOAPI.Stripe.Schemas.Customer])

    embeds_one(:us_bank_account, ExOAPI.Stripe.Schemas.PaymentMethodUsBankAccount)

    embeds_one(:boleto, ExOAPI.Stripe.Schemas.PaymentMethodBoleto)

    field(:object, Ecto.Enum, values: [:payment_method])

    field(:konbini, {:array, :map})

    embeds_one(:billing_details, ExOAPI.Stripe.Schemas.BillingDetails)

    field(:wechat_pay, {:array, :map})

    embeds_one(:sofort, ExOAPI.Stripe.Schemas.PaymentMethodSofort)

    embeds_one(:p24, ExOAPI.Stripe.Schemas.PaymentMethodP24)

    field(:created, :integer)

    field(:afterpay_clearpay, {:array, :map})

    field(:type, Ecto.Enum,
      values: [
        :wechat_pay,
        :us_bank_account,
        :sofort,
        :sepa_debit,
        :paynow,
        :p24,
        :oxxo,
        :konbini,
        :klarna,
        :interac_present,
        :ideal,
        :grabpay,
        :giropay,
        :fpx,
        :eps,
        :customer_balance,
        :card_present,
        :card,
        :boleto,
        :bancontact,
        :bacs_debit,
        :au_becs_debit,
        :alipay,
        :afterpay_clearpay,
        :acss_debit
      ]
    )

    field(:grabpay, {:array, :map})

    field(:bancontact, {:array, :map})

    embeds_one(:au_becs_debit, ExOAPI.Stripe.Schemas.PaymentMethodAuBecsDebit)

    field(:customer_balance, {:array, :map})

    field(:card_present, {:array, :map})

    embeds_one(:sepa_debit, ExOAPI.Stripe.Schemas.PaymentMethodSepaDebit)

    embeds_one(:klarna, ExOAPI.Stripe.Schemas.PaymentMethodKlarna)

    field(:paynow, {:array, :map})

    field(:id, :string)

    embeds_one(:eps, ExOAPI.Stripe.Schemas.PaymentMethodEps)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :id,
      :paynow,
      :card_present,
      :customer_balance,
      :bancontact,
      :grabpay,
      :type,
      :afterpay_clearpay,
      :created,
      :wechat_pay,
      :konbini,
      :object,
      :customer,
      :interac_present,
      :oxxo,
      :metadata,
      :giropay,
      :alipay,
      :livemode
    ])
    |> validate_required([:id, :type, :created, :object, :livemode])
    |> cast_embed(:eps)
    |> cast_embed(:klarna)
    |> cast_embed(:sepa_debit)
    |> cast_embed(:au_becs_debit)
    |> cast_embed(:p24)
    |> cast_embed(:sofort)
    |> cast_embed(:billing_details, required: true)
    |> cast_embed(:boleto)
    |> cast_embed(:us_bank_account)
    |> cast_embed(:card)
    |> cast_embed(:ideal)
    |> cast_embed(:bacs_debit)
    |> cast_embed(:acss_debit)
    |> cast_embed(:fpx)
  end
end