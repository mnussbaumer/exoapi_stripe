defmodule ExOAPI.Stripe.Schemas.PaymentIntentPaymentMethodOptionsCard do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:capture_method** :: *:string*

  Controls when the funds will be captured from the customer's account.


  **:installments** :: *ExOAPI.Stripe.Schemas.PaymentMethodOptionsCardInstallments*

  Installment details for this payment (Mexico only).

  For more information, see the [installments integration guide](https://stripe.com/docs/payments/installments).


  **:mandate_options** :: *ExOAPI.Stripe.Schemas.PaymentMethodOptionsCardMandateOptions*

  Configuration options for setting up an eMandate for cards issued in India.


  **:network** :: *:string*

  Selected network to process this payment intent on. Depends on the available networks of the card attached to the payment intent. Can be only set confirm-time.


  **:request_three_d_secure** :: *:string*

  We strongly recommend that you rely on our SCA Engine to automatically prompt your customers for authentication based on risk level and [other requirements](https://stripe.com/docs/strong-customer-authentication). However, if you wish to request 3D Secure based on logic from your own fraud engine, provide this option. Permitted values include: `automatic` or `any`. If not provided, defaults to `automatic`. Read our guide on [manually requesting 3D Secure](https://stripe.com/docs/payments/3d-secure#manual-three-ds) for more information on how this configuration interacts with Radar and our SCA Engine.


  **:setup_future_usage** :: *:string*

  Indicates that you intend to make future payments with this PaymentIntent's payment method.

  Providing this parameter will [attach the payment method](https://stripe.com/docs/payments/save-during-payment) to the PaymentIntent's Customer, if present, after the PaymentIntent is confirmed and any required actions from the user are complete. If no Customer was provided, the payment method can still be [attached](https://stripe.com/docs/api/payment_methods/attach) to a Customer after the transaction completes.

  When processing card payments, Stripe also uses `setup_future_usage` to dynamically optimize your payment flow and comply with regional legislation and network rules, such as [SCA](https://stripe.com/docs/strong-customer-authentication).


  """

  @primary_key false
  typed_embedded_schema do
    field(:capture_method, Ecto.Enum, values: [:manual])

    field(:installments, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.PaymentMethodOptionsCardInstallments]
    )

    field(:mandate_options, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.PaymentMethodOptionsCardMandateOptions]
    )

    field(:network, Ecto.Enum,
      values: [
        :visa,
        :unknown,
        :unionpay,
        :mastercard,
        :jcb,
        :interac,
        :discover,
        :diners,
        :cartes_bancaires,
        :amex
      ]
    )

    field(:request_three_d_secure, Ecto.Enum, values: [:challenge_only, :automatic, :any])

    field(:setup_future_usage, Ecto.Enum, values: [:on_session, :off_session, :none])
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :setup_future_usage,
      :request_three_d_secure,
      :network,
      :mandate_options,
      :installments,
      :capture_method
    ])
  end
end