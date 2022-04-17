defmodule ExOAPI.Stripe.Schemas.SourceTransactionAchCreditTransferData do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:customer_data** :: *:string*

  Customer data associated with the transfer.


  **:fingerprint** :: *:string*

  Bank account fingerprint associated with the transfer.


  **:last4** :: *:string*

  Last 4 digits of the account number associated with the transfer.


  **:routing_number** :: *:string*

  Routing number associated with the transfer.


  """

  @primary_key false
  typed_embedded_schema do
    field(:customer_data, :string)

    field(:fingerprint, :string)

    field(:last4, :string)

    field(:routing_number, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:routing_number, :last4, :fingerprint, :customer_data])
  end
end