defmodule ExOAPI.Stripe.Schemas.FundingInstructions do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: Each customer has a [`balance`](https://stripe.com/docs/api/customers/object#customer_object-balance) that is
  automatically applied to future invoices and payments using the `customer_balance` payment method.
  Customers can fund this balance by initiating a bank transfer to any account in the
  `financial_addresses` field.
  Related guide: [Customer Balance - Funding Instructions](https://stripe.com/docs/payments/customer-balance/funding-instructions) to learn more

  **:bank_transfer** :: *ExOAPI.Stripe.Schemas.FundingInstructionsBankTransfer*


  **:currency** :: *:string*

  Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).


  **:funding_type** :: *:string*

  The `funding_type` of the returned instructions


  **:livemode** :: *:boolean*

  Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  """

  @primary_key false
  typed_embedded_schema do
    embeds_one(:bank_transfer, ExOAPI.Stripe.Schemas.FundingInstructionsBankTransfer)

    field(:currency, :string)

    field(:funding_type, Ecto.Enum, values: [:bank_transfer])

    field(:livemode, :boolean)

    field(:object, Ecto.Enum, values: [:funding_instructions])
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:object, :livemode, :funding_type, :currency])
    |> validate_required([:object, :livemode, :funding_type, :currency])
    |> cast_embed(:bank_transfer, required: true)
  end
end