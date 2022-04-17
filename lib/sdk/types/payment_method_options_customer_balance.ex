defmodule ExOAPI.Stripe.Schemas.PaymentMethodOptionsCustomerBalance do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:bank_transfer** :: *ExOAPI.Stripe.Schemas.PaymentMethodOptionsCustomerBalanceBankTransfer*


  **:funding_type** :: *:string*

  The funding method type to be used when there are not enough funds in the customer balance. Permitted values include: `bank_transfer`.


  **:setup_future_usage** :: *:string*

  Indicates that you intend to make future payments with this PaymentIntent's payment method.

  Providing this parameter will [attach the payment method](https://stripe.com/docs/payments/save-during-payment) to the PaymentIntent's Customer, if present, after the PaymentIntent is confirmed and any required actions from the user are complete. If no Customer was provided, the payment method can still be [attached](https://stripe.com/docs/api/payment_methods/attach) to a Customer after the transaction completes.

  When processing card payments, Stripe also uses `setup_future_usage` to dynamically optimize your payment flow and comply with regional legislation and network rules, such as [SCA](https://stripe.com/docs/strong-customer-authentication).


  """

  @primary_key false
  typed_embedded_schema do
    embeds_one(
      :bank_transfer,
      ExOAPI.Stripe.Schemas.PaymentMethodOptionsCustomerBalanceBankTransfer
    )

    field(:funding_type, Ecto.Enum, values: [:bank_transfer])

    field(:setup_future_usage, Ecto.Enum, values: [:none])
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:setup_future_usage, :funding_type])
    |> cast_embed(:bank_transfer)
  end
end