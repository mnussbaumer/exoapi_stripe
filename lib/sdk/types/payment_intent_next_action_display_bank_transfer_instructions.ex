defmodule ExOAPI.Stripe.Schemas.PaymentIntentNextActionDisplayBankTransferInstructions do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:amount_remaining** :: *:integer*

  The remaining amount that needs to be transferred to complete the payment.


  **:currency** :: *:string*

  Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).


  **::financial_addresses** :: *ExOAPI.Stripe.Schemas.FundingInstructionsBankTransferFinancialAddress*


  **:reference** :: *:string*

  A string identifying this payment. Instruct your customer to include this code in the reference or memo field of their bank transfer.


  **:type** :: *:string*

  Type of bank transfer


  """

  @primary_key false
  typed_embedded_schema do
    field(:amount_remaining, :integer)

    field(:currency, :string)

    embeds_many(
      :financial_addresses,
      ExOAPI.Stripe.Schemas.FundingInstructionsBankTransferFinancialAddress
    )

    field(:reference, :string)

    field(:type, Ecto.Enum, values: [:jp_bank_transfer])
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:type, :reference, :currency, :amount_remaining])
    |> validate_required([:type])
    |> cast_embed(:financial_addresses)
  end
end