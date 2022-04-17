defmodule ExOAPI.Stripe.Schemas.AccountPayoutSettings do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:debit_negative_balances** :: *:boolean*

  A Boolean indicating if Stripe should try to reclaim negative balances from an attached bank account. See our [Understanding Connect Account Balances](https://stripe.com/docs/connect/account-balances) documentation for details. Default value is `false` for Custom accounts, otherwise `true`.


  **:schedule** :: *ExOAPI.Stripe.Schemas.TransferSchedule*


  **:statement_descriptor** :: *:string*

  The text that appears on the bank account statement for payouts. If not set, this defaults to the platform's bank descriptor as set in the Dashboard.


  """

  @primary_key false
  typed_embedded_schema do
    field(:debit_negative_balances, :boolean)

    embeds_one(:schedule, ExOAPI.Stripe.Schemas.TransferSchedule)

    field(:statement_descriptor, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:statement_descriptor, :debit_negative_balances])
    |> validate_required([:debit_negative_balances])
    |> cast_embed(:schedule, required: true)
  end
end