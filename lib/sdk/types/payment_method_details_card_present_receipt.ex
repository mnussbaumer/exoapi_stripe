defmodule ExOAPI.Stripe.Schemas.PaymentMethodDetailsCardPresentReceipt do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:account_type** :: *:string*

  The type of account being debited or credited


  **:application_cryptogram** :: *:string*

  EMV tag 9F26, cryptogram generated by the integrated circuit chip.


  **:application_preferred_name** :: *:string*

  Mnenomic of the Application Identifier.


  **:authorization_code** :: *:string*

  Identifier for this transaction.


  **:authorization_response_code** :: *:string*

  EMV tag 8A. A code returned by the card issuer.


  **:cardholder_verification_method** :: *:string*

  How the cardholder verified ownership of the card.


  **:dedicated_file_name** :: *:string*

  EMV tag 84. Similar to the application identifier stored on the integrated circuit chip.


  **:terminal_verification_results** :: *:string*

  The outcome of a series of EMV functions performed by the card reader.


  **:transaction_status_information** :: *:string*

  An indication of various EMV functions performed during the transaction.


  """

  @primary_key false
  typed_embedded_schema do
    field(:account_type, Ecto.Enum, values: [:unknown, :prepaid, :credit, :checking])

    field(:application_cryptogram, :string)

    field(:application_preferred_name, :string)

    field(:authorization_code, :string)

    field(:authorization_response_code, :string)

    field(:cardholder_verification_method, :string)

    field(:dedicated_file_name, :string)

    field(:terminal_verification_results, :string)

    field(:transaction_status_information, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :transaction_status_information,
      :terminal_verification_results,
      :dedicated_file_name,
      :cardholder_verification_method,
      :authorization_response_code,
      :authorization_code,
      :application_preferred_name,
      :application_cryptogram,
      :account_type
    ])
  end
end