defmodule ExOAPI.Stripe.Schemas.PaymentIntentTypeSpecificPaymentMethodOptionsClient do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:capture_method** :: *:string*

  Controls when the funds will be captured from the customer's account.


  **:setup_future_usage** :: *:string*

  Indicates that you intend to make future payments with this PaymentIntent's payment method.

  Providing this parameter will [attach the payment method](https://stripe.com/docs/payments/save-during-payment) to the PaymentIntent's Customer, if present, after the PaymentIntent is confirmed and any required actions from the user are complete. If no Customer was provided, the payment method can still be [attached](https://stripe.com/docs/api/payment_methods/attach) to a Customer after the transaction completes.

  When processing card payments, Stripe also uses `setup_future_usage` to dynamically optimize your payment flow and comply with regional legislation and network rules, such as [SCA](https://stripe.com/docs/strong-customer-authentication).


  **:verification_method** :: *:string*

  Bank account verification method.


  """

  @primary_key false
  typed_embedded_schema do
    field(:capture_method, Ecto.Enum, values: [:manual])

    field(:setup_future_usage, Ecto.Enum, values: [:on_session, :off_session, :none])

    field(:verification_method, Ecto.Enum, values: [:microdeposits, :instant, :automatic])
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:verification_method, :setup_future_usage, :capture_method])
  end
end