defmodule ExOAPI.Stripe.Schemas.BalanceAmountBySourceType do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:bank_account** :: *ExOAPI.Stripe.Schemas.BankAccount*

  Amount for bank account.


  **:card** :: *ExOAPI.Stripe.Schemas.Card*

  Amount for card.


  **:fpx** :: *:integer*

  Amount for FPX.


  """

  @primary_key false
  typed_embedded_schema do
    field(:bank_account, :integer)

    field(:card, :integer)

    field(:fpx, :integer)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:fpx, :card, :bank_account])
  end
end