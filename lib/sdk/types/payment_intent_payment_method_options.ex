defmodule ExOAPI.Stripe.Schemas.PaymentIntentPaymentMethodOptions do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:acss_debit** :: *ExOAPI.Stripe.Schemas.PaymentIntentTypeSpecificPaymentMethodOptionsClient | ExOAPI.Stripe.Schemas.PaymentIntentPaymentMethodOptionsAcssDebit*


  **:afterpay_clearpay** :: *ExOAPI.Stripe.Schemas.PaymentIntentTypeSpecificPaymentMethodOptionsClient | ExOAPI.Stripe.Schemas.PaymentMethodOptionsAfterpayClearpay*


  **:alipay** :: *ExOAPI.Stripe.Schemas.PaymentIntentTypeSpecificPaymentMethodOptionsClient | ExOAPI.Stripe.Schemas.PaymentMethodOptionsAlipay*


  **:au_becs_debit** :: *ExOAPI.Stripe.Schemas.PaymentIntentTypeSpecificPaymentMethodOptionsClient | ExOAPI.Stripe.Schemas.PaymentIntentPaymentMethodOptionsAuBecsDebit*


  **:bacs_debit** :: *ExOAPI.Stripe.Schemas.PaymentIntentTypeSpecificPaymentMethodOptionsClient | ExOAPI.Stripe.Schemas.PaymentMethodOptionsBacsDebit*


  **:bancontact** :: *ExOAPI.Stripe.Schemas.PaymentIntentTypeSpecificPaymentMethodOptionsClient | ExOAPI.Stripe.Schemas.PaymentMethodOptionsBancontact*


  **:boleto** :: *ExOAPI.Stripe.Schemas.PaymentIntentTypeSpecificPaymentMethodOptionsClient | ExOAPI.Stripe.Schemas.PaymentMethodOptionsBoleto*


  **:card** :: *ExOAPI.Stripe.Schemas.PaymentIntentTypeSpecificPaymentMethodOptionsClient | ExOAPI.Stripe.Schemas.PaymentIntentPaymentMethodOptionsCard*


  **:card_present** :: *ExOAPI.Stripe.Schemas.PaymentIntentTypeSpecificPaymentMethodOptionsClient | ExOAPI.Stripe.Schemas.PaymentMethodOptionsCardPresent*


  **:customer_balance** :: *ExOAPI.Stripe.Schemas.PaymentIntentTypeSpecificPaymentMethodOptionsClient | ExOAPI.Stripe.Schemas.PaymentMethodOptionsCustomerBalance*


  **:eps** :: *ExOAPI.Stripe.Schemas.PaymentIntentTypeSpecificPaymentMethodOptionsClient | ExOAPI.Stripe.Schemas.PaymentIntentPaymentMethodOptionsEps*


  **:fpx** :: *ExOAPI.Stripe.Schemas.PaymentIntentTypeSpecificPaymentMethodOptionsClient | ExOAPI.Stripe.Schemas.PaymentMethodOptionsFpx*


  **:giropay** :: *ExOAPI.Stripe.Schemas.PaymentIntentTypeSpecificPaymentMethodOptionsClient | ExOAPI.Stripe.Schemas.PaymentMethodOptionsGiropay*


  **:grabpay** :: *ExOAPI.Stripe.Schemas.PaymentIntentTypeSpecificPaymentMethodOptionsClient | ExOAPI.Stripe.Schemas.PaymentMethodOptionsGrabpay*


  **:ideal** :: *ExOAPI.Stripe.Schemas.PaymentIntentTypeSpecificPaymentMethodOptionsClient | ExOAPI.Stripe.Schemas.PaymentMethodOptionsIdeal*


  **:interac_present** :: *ExOAPI.Stripe.Schemas.PaymentIntentTypeSpecificPaymentMethodOptionsClient | :map*


  **:klarna** :: *ExOAPI.Stripe.Schemas.PaymentIntentTypeSpecificPaymentMethodOptionsClient | ExOAPI.Stripe.Schemas.PaymentMethodOptionsKlarna*


  **:konbini** :: *ExOAPI.Stripe.Schemas.PaymentIntentTypeSpecificPaymentMethodOptionsClient | ExOAPI.Stripe.Schemas.PaymentMethodOptionsKonbini*


  **:oxxo** :: *ExOAPI.Stripe.Schemas.PaymentIntentTypeSpecificPaymentMethodOptionsClient | ExOAPI.Stripe.Schemas.PaymentMethodOptionsOxxo*


  **:p24** :: *ExOAPI.Stripe.Schemas.PaymentIntentTypeSpecificPaymentMethodOptionsClient | ExOAPI.Stripe.Schemas.PaymentMethodOptionsP24*


  **:paynow** :: *ExOAPI.Stripe.Schemas.PaymentIntentTypeSpecificPaymentMethodOptionsClient | ExOAPI.Stripe.Schemas.PaymentMethodOptionsPaynow*


  **:sepa_debit** :: *ExOAPI.Stripe.Schemas.PaymentIntentTypeSpecificPaymentMethodOptionsClient | ExOAPI.Stripe.Schemas.PaymentIntentPaymentMethodOptionsSepaDebit*


  **:sofort** :: *ExOAPI.Stripe.Schemas.PaymentIntentTypeSpecificPaymentMethodOptionsClient | ExOAPI.Stripe.Schemas.PaymentMethodOptionsSofort*


  **:us_bank_account** :: *ExOAPI.Stripe.Schemas.PaymentIntentTypeSpecificPaymentMethodOptionsClient | ExOAPI.Stripe.Schemas.PaymentIntentPaymentMethodOptionsUsBankAccount*


  **:wechat_pay** :: *ExOAPI.Stripe.Schemas.PaymentIntentTypeSpecificPaymentMethodOptionsClient | ExOAPI.Stripe.Schemas.PaymentMethodOptionsWechatPay*


  """

  @primary_key false
  typed_embedded_schema do
    field(:acss_debit, ExOAPI.EctoTypes.AnyOf,
      types: [
        ExOAPI.Stripe.Schemas.PaymentIntentPaymentMethodOptionsAcssDebit,
        ExOAPI.Stripe.Schemas.PaymentIntentTypeSpecificPaymentMethodOptionsClient
      ]
    )

    field(:afterpay_clearpay, ExOAPI.EctoTypes.AnyOf,
      types: [
        ExOAPI.Stripe.Schemas.PaymentMethodOptionsAfterpayClearpay,
        ExOAPI.Stripe.Schemas.PaymentIntentTypeSpecificPaymentMethodOptionsClient
      ]
    )

    field(:alipay, ExOAPI.EctoTypes.AnyOf,
      types: [
        ExOAPI.Stripe.Schemas.PaymentMethodOptionsAlipay,
        ExOAPI.Stripe.Schemas.PaymentIntentTypeSpecificPaymentMethodOptionsClient
      ]
    )

    field(:au_becs_debit, ExOAPI.EctoTypes.AnyOf,
      types: [
        ExOAPI.Stripe.Schemas.PaymentIntentPaymentMethodOptionsAuBecsDebit,
        ExOAPI.Stripe.Schemas.PaymentIntentTypeSpecificPaymentMethodOptionsClient
      ]
    )

    field(:bacs_debit, ExOAPI.EctoTypes.AnyOf,
      types: [
        ExOAPI.Stripe.Schemas.PaymentMethodOptionsBacsDebit,
        ExOAPI.Stripe.Schemas.PaymentIntentTypeSpecificPaymentMethodOptionsClient
      ]
    )

    field(:bancontact, ExOAPI.EctoTypes.AnyOf,
      types: [
        ExOAPI.Stripe.Schemas.PaymentMethodOptionsBancontact,
        ExOAPI.Stripe.Schemas.PaymentIntentTypeSpecificPaymentMethodOptionsClient
      ]
    )

    field(:boleto, ExOAPI.EctoTypes.AnyOf,
      types: [
        ExOAPI.Stripe.Schemas.PaymentMethodOptionsBoleto,
        ExOAPI.Stripe.Schemas.PaymentIntentTypeSpecificPaymentMethodOptionsClient
      ]
    )

    field(:card, ExOAPI.EctoTypes.AnyOf,
      types: [
        ExOAPI.Stripe.Schemas.PaymentIntentPaymentMethodOptionsCard,
        ExOAPI.Stripe.Schemas.PaymentIntentTypeSpecificPaymentMethodOptionsClient
      ]
    )

    field(:card_present, ExOAPI.EctoTypes.AnyOf,
      types: [
        ExOAPI.Stripe.Schemas.PaymentMethodOptionsCardPresent,
        ExOAPI.Stripe.Schemas.PaymentIntentTypeSpecificPaymentMethodOptionsClient
      ]
    )

    field(:customer_balance, ExOAPI.EctoTypes.AnyOf,
      types: [
        ExOAPI.Stripe.Schemas.PaymentMethodOptionsCustomerBalance,
        ExOAPI.Stripe.Schemas.PaymentIntentTypeSpecificPaymentMethodOptionsClient
      ]
    )

    field(:eps, ExOAPI.EctoTypes.AnyOf,
      types: [
        ExOAPI.Stripe.Schemas.PaymentIntentPaymentMethodOptionsEps,
        ExOAPI.Stripe.Schemas.PaymentIntentTypeSpecificPaymentMethodOptionsClient
      ]
    )

    field(:fpx, ExOAPI.EctoTypes.AnyOf,
      types: [
        ExOAPI.Stripe.Schemas.PaymentMethodOptionsFpx,
        ExOAPI.Stripe.Schemas.PaymentIntentTypeSpecificPaymentMethodOptionsClient
      ]
    )

    field(:giropay, ExOAPI.EctoTypes.AnyOf,
      types: [
        ExOAPI.Stripe.Schemas.PaymentMethodOptionsGiropay,
        ExOAPI.Stripe.Schemas.PaymentIntentTypeSpecificPaymentMethodOptionsClient
      ]
    )

    field(:grabpay, ExOAPI.EctoTypes.AnyOf,
      types: [
        ExOAPI.Stripe.Schemas.PaymentMethodOptionsGrabpay,
        ExOAPI.Stripe.Schemas.PaymentIntentTypeSpecificPaymentMethodOptionsClient
      ]
    )

    field(:ideal, ExOAPI.EctoTypes.AnyOf,
      types: [
        ExOAPI.Stripe.Schemas.PaymentMethodOptionsIdeal,
        ExOAPI.Stripe.Schemas.PaymentIntentTypeSpecificPaymentMethodOptionsClient
      ]
    )

    field(:interac_present, ExOAPI.EctoTypes.AnyOf,
      types: [:map, ExOAPI.Stripe.Schemas.PaymentIntentTypeSpecificPaymentMethodOptionsClient]
    )

    field(:klarna, ExOAPI.EctoTypes.AnyOf,
      types: [
        ExOAPI.Stripe.Schemas.PaymentMethodOptionsKlarna,
        ExOAPI.Stripe.Schemas.PaymentIntentTypeSpecificPaymentMethodOptionsClient
      ]
    )

    field(:konbini, ExOAPI.EctoTypes.AnyOf,
      types: [
        ExOAPI.Stripe.Schemas.PaymentMethodOptionsKonbini,
        ExOAPI.Stripe.Schemas.PaymentIntentTypeSpecificPaymentMethodOptionsClient
      ]
    )

    field(:oxxo, ExOAPI.EctoTypes.AnyOf,
      types: [
        ExOAPI.Stripe.Schemas.PaymentMethodOptionsOxxo,
        ExOAPI.Stripe.Schemas.PaymentIntentTypeSpecificPaymentMethodOptionsClient
      ]
    )

    field(:p24, ExOAPI.EctoTypes.AnyOf,
      types: [
        ExOAPI.Stripe.Schemas.PaymentMethodOptionsP24,
        ExOAPI.Stripe.Schemas.PaymentIntentTypeSpecificPaymentMethodOptionsClient
      ]
    )

    field(:paynow, ExOAPI.EctoTypes.AnyOf,
      types: [
        ExOAPI.Stripe.Schemas.PaymentMethodOptionsPaynow,
        ExOAPI.Stripe.Schemas.PaymentIntentTypeSpecificPaymentMethodOptionsClient
      ]
    )

    field(:sepa_debit, ExOAPI.EctoTypes.AnyOf,
      types: [
        ExOAPI.Stripe.Schemas.PaymentIntentPaymentMethodOptionsSepaDebit,
        ExOAPI.Stripe.Schemas.PaymentIntentTypeSpecificPaymentMethodOptionsClient
      ]
    )

    field(:sofort, ExOAPI.EctoTypes.AnyOf,
      types: [
        ExOAPI.Stripe.Schemas.PaymentMethodOptionsSofort,
        ExOAPI.Stripe.Schemas.PaymentIntentTypeSpecificPaymentMethodOptionsClient
      ]
    )

    field(:us_bank_account, ExOAPI.EctoTypes.AnyOf,
      types: [
        ExOAPI.Stripe.Schemas.PaymentIntentPaymentMethodOptionsUsBankAccount,
        ExOAPI.Stripe.Schemas.PaymentIntentTypeSpecificPaymentMethodOptionsClient
      ]
    )

    field(:wechat_pay, ExOAPI.EctoTypes.AnyOf,
      types: [
        ExOAPI.Stripe.Schemas.PaymentMethodOptionsWechatPay,
        ExOAPI.Stripe.Schemas.PaymentIntentTypeSpecificPaymentMethodOptionsClient
      ]
    )
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
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
    ])
  end
end