defmodule ExOAPI.Stripe.Schemas.SubscriptionsResourcePaymentMethodOptions do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:acss_debit** :: *ExOAPI.Stripe.Schemas.InvoicePaymentMethodOptionsAcssDebit*

  This sub-hash contains details about the Canadian pre-authorized debit payment method options to pass to invoices created by the subscription.


  **:bancontact** :: *ExOAPI.Stripe.Schemas.InvoicePaymentMethodOptionsBancontact*

  This sub-hash contains details about the Bancontact payment method options to pass to invoices created by the subscription.


  **:card** :: *ExOAPI.Stripe.Schemas.SubscriptionPaymentMethodOptionsCard*

  This sub-hash contains details about the Card payment method options to pass to invoices created by the subscription.


  **:customer_balance** :: *ExOAPI.Stripe.Schemas.InvoicePaymentMethodOptionsCustomerBalance*

  This sub-hash contains details about the Bank transfer payment method options to pass to invoices created by the subscription.


  **:konbini** :: *:map*

  This sub-hash contains details about the Konbini payment method options to pass to invoices created by the subscription.


  **:us_bank_account** :: *ExOAPI.Stripe.Schemas.InvoicePaymentMethodOptionsUsBankAccount*

  This sub-hash contains details about the ACH direct debit payment method options to pass to invoices created by the subscription.


  """

  @primary_key false
  typed_embedded_schema do
    field(:acss_debit, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.InvoicePaymentMethodOptionsAcssDebit]
    )

    field(:bancontact, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.InvoicePaymentMethodOptionsBancontact]
    )

    field(:card, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.SubscriptionPaymentMethodOptionsCard]
    )

    field(:customer_balance, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.InvoicePaymentMethodOptionsCustomerBalance]
    )

    field(:konbini, ExOAPI.EctoTypes.AnyOf, types: [:map])

    field(:us_bank_account, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.InvoicePaymentMethodOptionsUsBankAccount]
    )
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :us_bank_account,
      :konbini,
      :customer_balance,
      :card,
      :bancontact,
      :acss_debit
    ])
  end
end