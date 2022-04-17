defmodule ExOAPI.Stripe.Schemas.AccountCapabilities do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:acss_debit_payments** :: *:string*

  The status of the Canadian pre-authorized debits payments capability of the account, or whether the account can directly process Canadian pre-authorized debits charges.


  **:afterpay_clearpay_payments** :: *:string*

  The status of the Afterpay Clearpay capability of the account, or whether the account can directly process Afterpay Clearpay charges.


  **:au_becs_debit_payments** :: *:string*

  The status of the BECS Direct Debit (AU) payments capability of the account, or whether the account can directly process BECS Direct Debit (AU) charges.


  **:bacs_debit_payments** :: *:string*

  The status of the Bacs Direct Debits payments capability of the account, or whether the account can directly process Bacs Direct Debits charges.


  **:bancontact_payments** :: *:string*

  The status of the Bancontact payments capability of the account, or whether the account can directly process Bancontact charges.


  **:bank_transfer_payments** :: *:string*

  The status of the customer_balance payments capability of the account, or whether the account can directly process customer_balance charges.


  **:boleto_payments** :: *:string*

  The status of the boleto payments capability of the account, or whether the account can directly process boleto charges.


  **:card_issuing** :: *:string*

  The status of the card issuing capability of the account, or whether you can use Issuing to distribute funds on cards


  **:card_payments** :: *:string*

  The status of the card payments capability of the account, or whether the account can directly process credit and debit card charges.


  **:cartes_bancaires_payments** :: *:string*

  The status of the Cartes Bancaires payments capability of the account, or whether the account can directly process Cartes Bancaires card charges in EUR currency.


  **:eps_payments** :: *:string*

  The status of the EPS payments capability of the account, or whether the account can directly process EPS charges.


  **:fpx_payments** :: *:string*

  The status of the FPX payments capability of the account, or whether the account can directly process FPX charges.


  **:giropay_payments** :: *:string*

  The status of the giropay payments capability of the account, or whether the account can directly process giropay charges.


  **:grabpay_payments** :: *:string*

  The status of the GrabPay payments capability of the account, or whether the account can directly process GrabPay charges.


  **:ideal_payments** :: *:string*

  The status of the iDEAL payments capability of the account, or whether the account can directly process iDEAL charges.


  **:jcb_payments** :: *:string*

  The status of the JCB payments capability of the account, or whether the account (Japan only) can directly process JCB credit card charges in JPY currency.


  **:klarna_payments** :: *:string*

  The status of the Klarna payments capability of the account, or whether the account can directly process Klarna charges.


  **:konbini_payments** :: *:string*

  The status of the konbini payments capability of the account, or whether the account can directly process konbini charges.


  **:legacy_payments** :: *:string*

  The status of the legacy payments capability of the account.


  **:oxxo_payments** :: *:string*

  The status of the OXXO payments capability of the account, or whether the account can directly process OXXO charges.


  **:p24_payments** :: *:string*

  The status of the P24 payments capability of the account, or whether the account can directly process P24 charges.


  **:paynow_payments** :: *:string*

  The status of the paynow payments capability of the account, or whether the account can directly process paynow charges.


  **:sepa_debit_payments** :: *:string*

  The status of the SEPA Direct Debits payments capability of the account, or whether the account can directly process SEPA Direct Debits charges.


  **:sofort_payments** :: *:string*

  The status of the Sofort payments capability of the account, or whether the account can directly process Sofort charges.


  **:tax_reporting_us_1099_k** :: *:string*

  The status of the tax reporting 1099-K (US) capability of the account.


  **:tax_reporting_us_1099_misc** :: *:string*

  The status of the tax reporting 1099-MISC (US) capability of the account.


  **:transfers** :: *:string*

  The status of the transfers capability of the account, or whether your platform can transfer funds to the account.


  **:us_bank_account_ach_payments** :: *:string*

  The status of the US bank account ACH payments capability of the account, or whether the account can directly process US bank account charges.


  """

  @primary_key false
  typed_embedded_schema do
    field(:acss_debit_payments, Ecto.Enum, values: [:pending, :inactive, :active])

    field(:afterpay_clearpay_payments, Ecto.Enum, values: [:pending, :inactive, :active])

    field(:au_becs_debit_payments, Ecto.Enum, values: [:pending, :inactive, :active])

    field(:bacs_debit_payments, Ecto.Enum, values: [:pending, :inactive, :active])

    field(:bancontact_payments, Ecto.Enum, values: [:pending, :inactive, :active])

    field(:bank_transfer_payments, Ecto.Enum, values: [:pending, :inactive, :active])

    field(:boleto_payments, Ecto.Enum, values: [:pending, :inactive, :active])

    field(:card_issuing, Ecto.Enum, values: [:pending, :inactive, :active])

    field(:card_payments, Ecto.Enum, values: [:pending, :inactive, :active])

    field(:cartes_bancaires_payments, Ecto.Enum, values: [:pending, :inactive, :active])

    field(:eps_payments, Ecto.Enum, values: [:pending, :inactive, :active])

    field(:fpx_payments, Ecto.Enum, values: [:pending, :inactive, :active])

    field(:giropay_payments, Ecto.Enum, values: [:pending, :inactive, :active])

    field(:grabpay_payments, Ecto.Enum, values: [:pending, :inactive, :active])

    field(:ideal_payments, Ecto.Enum, values: [:pending, :inactive, :active])

    field(:jcb_payments, Ecto.Enum, values: [:pending, :inactive, :active])

    field(:klarna_payments, Ecto.Enum, values: [:pending, :inactive, :active])

    field(:konbini_payments, Ecto.Enum, values: [:pending, :inactive, :active])

    field(:legacy_payments, Ecto.Enum, values: [:pending, :inactive, :active])

    field(:oxxo_payments, Ecto.Enum, values: [:pending, :inactive, :active])

    field(:p24_payments, Ecto.Enum, values: [:pending, :inactive, :active])

    field(:paynow_payments, Ecto.Enum, values: [:pending, :inactive, :active])

    field(:sepa_debit_payments, Ecto.Enum, values: [:pending, :inactive, :active])

    field(:sofort_payments, Ecto.Enum, values: [:pending, :inactive, :active])

    field(:tax_reporting_us_1099_k, Ecto.Enum, values: [:pending, :inactive, :active])

    field(:tax_reporting_us_1099_misc, Ecto.Enum, values: [:pending, :inactive, :active])

    field(:transfers, Ecto.Enum, values: [:pending, :inactive, :active])

    field(:us_bank_account_ach_payments, Ecto.Enum, values: [:pending, :inactive, :active])
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :us_bank_account_ach_payments,
      :transfers,
      :tax_reporting_us_1099_misc,
      :tax_reporting_us_1099_k,
      :sofort_payments,
      :sepa_debit_payments,
      :paynow_payments,
      :p24_payments,
      :oxxo_payments,
      :legacy_payments,
      :konbini_payments,
      :klarna_payments,
      :jcb_payments,
      :ideal_payments,
      :grabpay_payments,
      :giropay_payments,
      :fpx_payments,
      :eps_payments,
      :cartes_bancaires_payments,
      :card_payments,
      :card_issuing,
      :boleto_payments,
      :bank_transfer_payments,
      :bancontact_payments,
      :bacs_debit_payments,
      :au_becs_debit_payments,
      :afterpay_clearpay_payments,
      :acss_debit_payments
    ])
  end
end