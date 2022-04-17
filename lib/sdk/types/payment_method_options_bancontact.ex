defmodule ExOAPI.Stripe.Schemas.PaymentMethodOptionsBancontact do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:preferred_language** :: *:string*

  Preferred language of the Bancontact authorization page that the customer is redirected to.


  **:setup_future_usage** :: *:string*

  Indicates that you intend to make future payments with this PaymentIntent's payment method.

  Providing this parameter will [attach the payment method](https://stripe.com/docs/payments/save-during-payment) to the PaymentIntent's Customer, if present, after the PaymentIntent is confirmed and any required actions from the user are complete. If no Customer was provided, the payment method can still be [attached](https://stripe.com/docs/api/payment_methods/attach) to a Customer after the transaction completes.

  When processing card payments, Stripe also uses `setup_future_usage` to dynamically optimize your payment flow and comply with regional legislation and network rules, such as [SCA](https://stripe.com/docs/strong-customer-authentication).


  """

  @primary_key false
  typed_embedded_schema do
    field(:preferred_language, Ecto.Enum, values: [:nl, :fr, :en, :de])

    field(:setup_future_usage, Ecto.Enum, values: [:off_session, :none])
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:setup_future_usage, :preferred_language])
    |> validate_required([:preferred_language])
  end
end