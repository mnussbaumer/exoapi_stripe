defmodule ExOAPI.Stripe.Schemas.FundingInstructionsBankTransferFinancialAddress do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: FinancialAddresses contain identifying information that resolves to a FinancialAccount.

  **::supported_networks** :: *:string*


  **:type** :: *:string*

  The type of financial address


  **:zengin** :: *list(:map)*


  """

  @primary_key false
  typed_embedded_schema do
    field(:supported_networks, {:array, :string})

    field(:type, Ecto.Enum, values: [:zengin])

    field(:zengin, {:array, :map})
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:zengin, :type, :supported_networks])
    |> validate_required([:type])
  end
end