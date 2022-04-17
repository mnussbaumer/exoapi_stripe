defmodule ExOAPI.Stripe.Schemas.PaymentMethodDetails do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:ach_credit_transfer** :: *ExOAPI.Stripe.Schemas.PaymentMethodDetailsAchCreditTransfer*


  **:ach_debit** :: *ExOAPI.Stripe.Schemas.PaymentMethodDetailsAchDebit*


  **:acss_debit** :: *ExOAPI.Stripe.Schemas.PaymentMethodDetailsAcssDebit*


  **:afterpay_clearpay** :: *ExOAPI.Stripe.Schemas.PaymentMethodDetailsAfterpayClearpay*


  **:alipay** :: *ExOAPI.Stripe.Schemas.PaymentFlowsPrivatePaymentMethodsAlipayDetails*


  **:au_becs_debit** :: *ExOAPI.Stripe.Schemas.PaymentMethodDetailsAuBecsDebit*


  **:bacs_debit** :: *ExOAPI.Stripe.Schemas.PaymentMethodDetailsBacsDebit*


  **:bancontact** :: *ExOAPI.Stripe.Schemas.PaymentMethodDetailsBancontact*


  **:boleto** :: *ExOAPI.Stripe.Schemas.PaymentMethodDetailsBoleto*


  **:card** :: *ExOAPI.Stripe.Schemas.PaymentMethodDetailsCard*


  **:card_present** :: *ExOAPI.Stripe.Schemas.PaymentMethodDetailsCardPresent*


  **:customer_balance** :: *list(:map)*


  **:eps** :: *ExOAPI.Stripe.Schemas.PaymentMethodDetailsEps*


  **:fpx** :: *ExOAPI.Stripe.Schemas.PaymentMethodDetailsFpx*


  **:giropay** :: *ExOAPI.Stripe.Schemas.PaymentMethodDetailsGiropay*


  **:grabpay** :: *ExOAPI.Stripe.Schemas.PaymentMethodDetailsGrabpay*


  **:ideal** :: *ExOAPI.Stripe.Schemas.PaymentMethodDetailsIdeal*


  **:interac_present** :: *ExOAPI.Stripe.Schemas.PaymentMethodDetailsInteracPresent*


  **:klarna** :: *ExOAPI.Stripe.Schemas.PaymentMethodDetailsKlarna*


  **:konbini** :: *ExOAPI.Stripe.Schemas.PaymentMethodDetailsKonbini*


  **:multibanco** :: *ExOAPI.Stripe.Schemas.PaymentMethodDetailsMultibanco*


  **:oxxo** :: *ExOAPI.Stripe.Schemas.PaymentMethodDetailsOxxo*


  **:p24** :: *ExOAPI.Stripe.Schemas.PaymentMethodDetailsP24*


  **:paynow** :: *ExOAPI.Stripe.Schemas.PaymentMethodDetailsPaynow*


  **:sepa_debit** :: *ExOAPI.Stripe.Schemas.PaymentMethodDetailsSepaDebit*


  **:sofort** :: *ExOAPI.Stripe.Schemas.PaymentMethodDetailsSofort*


  **:stripe_account** :: *list(:map)*


  **:type** :: *:string*

  The type of transaction-specific details of the payment method used in the payment, one of `ach_credit_transfer`, `ach_debit`, `acss_debit`, `alipay`, `au_becs_debit`, `bancontact`, `card`, `card_present`, `eps`, `giropay`, `ideal`, `klarna`, `multibanco`, `p24`, `sepa_debit`, `sofort`, `stripe_account`, or `wechat`.
  An additional hash is included on `payment_method_details` with a name matching this value.
  It contains information specific to the payment method.


  **:us_bank_account** :: *ExOAPI.Stripe.Schemas.PaymentMethodDetailsUsBankAccount*


  **:wechat** :: *list(:map)*


  **:wechat_pay** :: *ExOAPI.Stripe.Schemas.PaymentMethodDetailsWechatPay*


  """

  @primary_key false
  typed_embedded_schema do
    embeds_one(:ach_credit_transfer, ExOAPI.Stripe.Schemas.PaymentMethodDetailsAchCreditTransfer)

    embeds_one(:ach_debit, ExOAPI.Stripe.Schemas.PaymentMethodDetailsAchDebit)

    embeds_one(:acss_debit, ExOAPI.Stripe.Schemas.PaymentMethodDetailsAcssDebit)

    embeds_one(:afterpay_clearpay, ExOAPI.Stripe.Schemas.PaymentMethodDetailsAfterpayClearpay)

    embeds_one(:alipay, ExOAPI.Stripe.Schemas.PaymentFlowsPrivatePaymentMethodsAlipayDetails)

    embeds_one(:au_becs_debit, ExOAPI.Stripe.Schemas.PaymentMethodDetailsAuBecsDebit)

    embeds_one(:bacs_debit, ExOAPI.Stripe.Schemas.PaymentMethodDetailsBacsDebit)

    embeds_one(:bancontact, ExOAPI.Stripe.Schemas.PaymentMethodDetailsBancontact)

    embeds_one(:boleto, ExOAPI.Stripe.Schemas.PaymentMethodDetailsBoleto)

    embeds_one(:card, ExOAPI.Stripe.Schemas.PaymentMethodDetailsCard)

    embeds_one(:card_present, ExOAPI.Stripe.Schemas.PaymentMethodDetailsCardPresent)

    field(:customer_balance, {:array, :map})

    embeds_one(:eps, ExOAPI.Stripe.Schemas.PaymentMethodDetailsEps)

    embeds_one(:fpx, ExOAPI.Stripe.Schemas.PaymentMethodDetailsFpx)

    embeds_one(:giropay, ExOAPI.Stripe.Schemas.PaymentMethodDetailsGiropay)

    embeds_one(:grabpay, ExOAPI.Stripe.Schemas.PaymentMethodDetailsGrabpay)

    embeds_one(:ideal, ExOAPI.Stripe.Schemas.PaymentMethodDetailsIdeal)

    embeds_one(:interac_present, ExOAPI.Stripe.Schemas.PaymentMethodDetailsInteracPresent)

    embeds_one(:klarna, ExOAPI.Stripe.Schemas.PaymentMethodDetailsKlarna)

    embeds_one(:konbini, ExOAPI.Stripe.Schemas.PaymentMethodDetailsKonbini)

    embeds_one(:multibanco, ExOAPI.Stripe.Schemas.PaymentMethodDetailsMultibanco)

    embeds_one(:oxxo, ExOAPI.Stripe.Schemas.PaymentMethodDetailsOxxo)

    embeds_one(:p24, ExOAPI.Stripe.Schemas.PaymentMethodDetailsP24)

    embeds_one(:paynow, ExOAPI.Stripe.Schemas.PaymentMethodDetailsPaynow)

    embeds_one(:sepa_debit, ExOAPI.Stripe.Schemas.PaymentMethodDetailsSepaDebit)

    embeds_one(:sofort, ExOAPI.Stripe.Schemas.PaymentMethodDetailsSofort)

    field(:stripe_account, {:array, :map})

    field(:type, :string)

    embeds_one(:us_bank_account, ExOAPI.Stripe.Schemas.PaymentMethodDetailsUsBankAccount)

    field(:wechat, {:array, :map})

    embeds_one(:wechat_pay, ExOAPI.Stripe.Schemas.PaymentMethodDetailsWechatPay)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:wechat, :type, :stripe_account, :customer_balance])
    |> validate_required([:type])
    |> cast_embed(:wechat_pay)
    |> cast_embed(:us_bank_account)
    |> cast_embed(:sofort)
    |> cast_embed(:sepa_debit)
    |> cast_embed(:paynow)
    |> cast_embed(:p24)
    |> cast_embed(:oxxo)
    |> cast_embed(:multibanco)
    |> cast_embed(:konbini)
    |> cast_embed(:klarna)
    |> cast_embed(:interac_present)
    |> cast_embed(:ideal)
    |> cast_embed(:grabpay)
    |> cast_embed(:giropay)
    |> cast_embed(:fpx)
    |> cast_embed(:eps)
    |> cast_embed(:card_present)
    |> cast_embed(:card)
    |> cast_embed(:boleto)
    |> cast_embed(:bancontact)
    |> cast_embed(:bacs_debit)
    |> cast_embed(:au_becs_debit)
    |> cast_embed(:alipay)
    |> cast_embed(:afterpay_clearpay)
    |> cast_embed(:acss_debit)
    |> cast_embed(:ach_debit)
    |> cast_embed(:ach_credit_transfer)
  end
end