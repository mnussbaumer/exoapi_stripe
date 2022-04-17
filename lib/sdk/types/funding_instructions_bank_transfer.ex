defmodule ExOAPI.Stripe.Schemas.FundingInstructionsBankTransfer do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:country** :: *:string*

  The country of the bank account to fund


  **::financial_addresses** :: *ExOAPI.Stripe.Schemas.FundingInstructionsBankTransferFinancialAddress*


  **:type** :: *:string*

  The bank_transfer type


  """

  @primary_key false
  typed_embedded_schema do
    field(:country, :string)

    embeds_many(
      :financial_addresses,
      ExOAPI.Stripe.Schemas.FundingInstructionsBankTransferFinancialAddress
    )

    field(:type, Ecto.Enum, values: [:jp_bank_transfer])
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:type, :country])
    |> validate_required([:type, :country])
    |> cast_embed(:financial_addresses, required: true)
  end
end