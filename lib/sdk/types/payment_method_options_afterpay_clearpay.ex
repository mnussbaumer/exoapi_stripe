defmodule ExOAPI.Stripe.Schemas.PaymentMethodOptionsAfterpayClearpay do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:capture_method** :: *:string*

  Controls when the funds will be captured from the customer's account.


  **:reference** :: *:string*

  Order identifier shown to the customer in Afterpay’s online portal. We recommend using a value that helps you answer any questions a customer might have about
  the payment. The identifier is limited to 128 characters and may contain only letters, digits, underscores, backslashes and dashes.


  **:setup_future_usage** :: *:string*

  Indicates that you intend to make future payments with this PaymentIntent's payment method.

  Providing this parameter will [attach the payment method](https://stripe.com/docs/payments/save-during-payment) to the PaymentIntent's Customer, if present, after the PaymentIntent is confirmed and any required actions from the user are complete. If no Customer was provided, the payment method can still be [attached](https://stripe.com/docs/api/payment_methods/attach) to a Customer after the transaction completes.

  When processing card payments, Stripe also uses `setup_future_usage` to dynamically optimize your payment flow and comply with regional legislation and network rules, such as [SCA](https://stripe.com/docs/strong-customer-authentication).


  """

  @primary_key false
  typed_embedded_schema do
    field(:capture_method, Ecto.Enum, values: [:manual])

    field(:reference, :string)

    field(:setup_future_usage, Ecto.Enum, values: [:none])
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:setup_future_usage, :reference, :capture_method])
  end
end