defmodule ExOAPI.Stripe.Schemas.InvoicesPaymentMethodOptions do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:acss_debit** :: *ExOAPI.Stripe.Schemas.InvoicePaymentMethodOptionsAcssDebit*

  If paying by `acss_debit`, this sub-hash contains details about the Canadian pre-authorized debit payment method options to pass to the invoice’s PaymentIntent.


  **:bancontact** :: *ExOAPI.Stripe.Schemas.InvoicePaymentMethodOptionsBancontact*

  If paying by `bancontact`, this sub-hash contains details about the Bancontact payment method options to pass to the invoice’s PaymentIntent.


  **:card** :: *ExOAPI.Stripe.Schemas.InvoicePaymentMethodOptionsCard*

  If paying by `card`, this sub-hash contains details about the Card payment method options to pass to the invoice’s PaymentIntent.


  **:customer_balance** :: *ExOAPI.Stripe.Schemas.InvoicePaymentMethodOptionsCustomerBalance*

  If paying by `customer_balance`, this sub-hash contains details about the Bank transfer payment method options to pass to the invoice’s PaymentIntent.


  **:konbini** :: *:map*

  If paying by `konbini`, this sub-hash contains details about the Konbini payment method options to pass to the invoice’s PaymentIntent.


  **:us_bank_account** :: *ExOAPI.Stripe.Schemas.InvoicePaymentMethodOptionsUsBankAccount*

  If paying by `us_bank_account`, this sub-hash contains details about the ACH direct debit payment method options to pass to the invoice’s PaymentIntent.


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
      types: [ExOAPI.Stripe.Schemas.InvoicePaymentMethodOptionsCard]
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