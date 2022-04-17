defmodule ExOAPI.Stripe.Schemas.PaymentIntentNextAction do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:alipay_handle_redirect** :: *ExOAPI.Stripe.Schemas.PaymentIntentNextActionAlipayHandleRedirect*


  **:boleto_display_details** :: *ExOAPI.Stripe.Schemas.PaymentIntentNextActionBoleto*


  **:card_await_notification** :: *ExOAPI.Stripe.Schemas.PaymentIntentNextActionCardAwaitNotification*


  **:display_bank_transfer_instructions** :: *ExOAPI.Stripe.Schemas.PaymentIntentNextActionDisplayBankTransferInstructions*


  **:konbini_display_details** :: *ExOAPI.Stripe.Schemas.PaymentIntentNextActionKonbini*


  **:oxxo_display_details** :: *ExOAPI.Stripe.Schemas.PaymentIntentNextActionDisplayOxxoDetails*


  **:paynow_display_qr_code** :: *ExOAPI.Stripe.Schemas.PaymentIntentNextActionPaynowDisplayQrCode*


  **:redirect_to_url** :: *ExOAPI.Stripe.Schemas.PaymentIntentNextActionRedirectToUrl*


  **:type** :: *:string*

  Type of the next action to perform, one of `redirect_to_url`, `use_stripe_sdk`, `alipay_handle_redirect`, `oxxo_display_details`, or `verify_with_microdeposits`.


  **:use_stripe_sdk** :: *:map*

  When confirming a PaymentIntent with Stripe.js, Stripe.js depends on the contents of this dictionary to invoke authentication flows. The shape of the contents is subject to change and is only intended to be used by Stripe.js.


  **:verify_with_microdeposits** :: *ExOAPI.Stripe.Schemas.PaymentIntentNextActionVerifyWithMicrodeposits*


  **:wechat_pay_display_qr_code** :: *ExOAPI.Stripe.Schemas.PaymentIntentNextActionWechatPayDisplayQrCode*


  **:wechat_pay_redirect_to_android_app** :: *ExOAPI.Stripe.Schemas.PaymentIntentNextActionWechatPayRedirectToAndroidApp*


  **:wechat_pay_redirect_to_ios_app** :: *ExOAPI.Stripe.Schemas.PaymentIntentNextActionWechatPayRedirectToIosApp*


  """

  @primary_key false
  typed_embedded_schema do
    embeds_one(
      :alipay_handle_redirect,
      ExOAPI.Stripe.Schemas.PaymentIntentNextActionAlipayHandleRedirect
    )

    embeds_one(:boleto_display_details, ExOAPI.Stripe.Schemas.PaymentIntentNextActionBoleto)

    embeds_one(
      :card_await_notification,
      ExOAPI.Stripe.Schemas.PaymentIntentNextActionCardAwaitNotification
    )

    embeds_one(
      :display_bank_transfer_instructions,
      ExOAPI.Stripe.Schemas.PaymentIntentNextActionDisplayBankTransferInstructions
    )

    embeds_one(:konbini_display_details, ExOAPI.Stripe.Schemas.PaymentIntentNextActionKonbini)

    embeds_one(
      :oxxo_display_details,
      ExOAPI.Stripe.Schemas.PaymentIntentNextActionDisplayOxxoDetails
    )

    embeds_one(
      :paynow_display_qr_code,
      ExOAPI.Stripe.Schemas.PaymentIntentNextActionPaynowDisplayQrCode
    )

    embeds_one(:redirect_to_url, ExOAPI.Stripe.Schemas.PaymentIntentNextActionRedirectToUrl)

    field(:type, :string)

    field(:use_stripe_sdk, :map)

    embeds_one(
      :verify_with_microdeposits,
      ExOAPI.Stripe.Schemas.PaymentIntentNextActionVerifyWithMicrodeposits
    )

    embeds_one(
      :wechat_pay_display_qr_code,
      ExOAPI.Stripe.Schemas.PaymentIntentNextActionWechatPayDisplayQrCode
    )

    embeds_one(
      :wechat_pay_redirect_to_android_app,
      ExOAPI.Stripe.Schemas.PaymentIntentNextActionWechatPayRedirectToAndroidApp
    )

    embeds_one(
      :wechat_pay_redirect_to_ios_app,
      ExOAPI.Stripe.Schemas.PaymentIntentNextActionWechatPayRedirectToIosApp
    )
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:use_stripe_sdk, :type])
    |> validate_required([:type])
    |> cast_embed(:wechat_pay_redirect_to_ios_app)
    |> cast_embed(:wechat_pay_redirect_to_android_app)
    |> cast_embed(:wechat_pay_display_qr_code)
    |> cast_embed(:verify_with_microdeposits)
    |> cast_embed(:redirect_to_url)
    |> cast_embed(:paynow_display_qr_code)
    |> cast_embed(:oxxo_display_details)
    |> cast_embed(:konbini_display_details)
    |> cast_embed(:display_bank_transfer_instructions)
    |> cast_embed(:card_await_notification)
    |> cast_embed(:boleto_display_details)
    |> cast_embed(:alipay_handle_redirect)
  end
end