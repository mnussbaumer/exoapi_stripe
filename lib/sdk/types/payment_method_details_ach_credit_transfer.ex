defmodule ExOAPI.Stripe.Schemas.PaymentMethodDetailsAchCreditTransfer do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:account_number** :: *:string*

  Account number to transfer funds to.


  **:bank_name** :: *:string*

  Name of the bank associated with the routing number.


  **:routing_number** :: *:string*

  Routing transit number for the bank account to transfer funds to.


  **:swift_code** :: *:string*

  SWIFT code of the bank associated with the routing number.


  """

  @primary_key false
  typed_embedded_schema do
    field(:account_number, :string)

    field(:bank_name, :string)

    field(:routing_number, :string)

    field(:swift_code, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:swift_code, :routing_number, :bank_name, :account_number])
  end
end