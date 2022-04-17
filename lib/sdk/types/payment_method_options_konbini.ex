defmodule ExOAPI.Stripe.Schemas.PaymentMethodOptionsKonbini do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:confirmation_number** :: *:string*

  An optional 10 to 11 digit numeric-only string determining the confirmation code at applicable convenience stores.


  **:expires_after_days** :: *:integer*

  The number of calendar days (between 1 and 60) after which Konbini payment instructions will expire. For example, if a PaymentIntent is confirmed with Konbini and `expires_after_days` set to 2 on Monday JST, the instructions will expire on Wednesday 23:59:59 JST.


  **:expires_at** :: *:integer*

  The timestamp at which the Konbini payment instructions will expire. Only one of `expires_after_days` or `expires_at` may be set.


  **:product_description** :: *:string*

  A product descriptor of up to 22 characters, which will appear to customers at the convenience store.


  **:setup_future_usage** :: *:string*

  Indicates that you intend to make future payments with this PaymentIntent's payment method.

  Providing this parameter will [attach the payment method](https://stripe.com/docs/payments/save-during-payment) to the PaymentIntent's Customer, if present, after the PaymentIntent is confirmed and any required actions from the user are complete. If no Customer was provided, the payment method can still be [attached](https://stripe.com/docs/api/payment_methods/attach) to a Customer after the transaction completes.

  When processing card payments, Stripe also uses `setup_future_usage` to dynamically optimize your payment flow and comply with regional legislation and network rules, such as [SCA](https://stripe.com/docs/strong-customer-authentication).


  """

  @primary_key false
  typed_embedded_schema do
    field(:confirmation_number, :string)

    field(:expires_after_days, :integer)

    field(:expires_at, :integer)

    field(:product_description, :string)

    field(:setup_future_usage, Ecto.Enum, values: [:none])
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :setup_future_usage,
      :product_description,
      :expires_at,
      :expires_after_days,
      :confirmation_number
    ])
  end
end