defmodule ExOAPI.Stripe.Schemas.PaymentMethodDetailsBancontact do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:bank_code** :: *:string*

  Bank code of bank associated with the bank account.


  **:bank_name** :: *:string*

  Name of the bank associated with the bank account.


  **:bic** :: *:string*

  Bank Identifier Code of the bank associated with the bank account.


  **:generated_sepa_debit** :: *ExOAPI.Stripe.Schemas.PaymentMethod | :string*

  The ID of the SEPA Direct Debit PaymentMethod which was generated by this Charge.


  **:generated_sepa_debit_mandate** :: *ExOAPI.Stripe.Schemas.Mandate | :string*

  The mandate for the SEPA Direct Debit PaymentMethod which was generated by this Charge.


  **:iban_last4** :: *:string*

  Last four characters of the IBAN.


  **:preferred_language** :: *:string*

  Preferred language of the Bancontact authorization page that the customer is redirected to.
  Can be one of `en`, `de`, `fr`, or `nl`


  **:verified_name** :: *:string*

  Owner's verified full name. Values are verified or provided by Bancontact directly
  (if supported) at the time of authorization or settlement. They cannot be set or mutated.


  """

  @primary_key false
  typed_embedded_schema do
    field(:bank_code, :string)

    field(:bank_name, :string)

    field(:bic, :string)

    field(:generated_sepa_debit, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.PaymentMethod]
    )

    field(:generated_sepa_debit_mandate, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.Mandate]
    )

    field(:iban_last4, :string)

    field(:preferred_language, Ecto.Enum, values: [:nl, :fr, :en, :de])

    field(:verified_name, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :verified_name,
      :preferred_language,
      :iban_last4,
      :generated_sepa_debit_mandate,
      :generated_sepa_debit,
      :bic,
      :bank_name,
      :bank_code
    ])
  end
end