defmodule ExOAPI.Stripe.Schemas.SourceTransactionGbpCreditTransferData do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:fingerprint** :: *:string*

  Bank account fingerprint associated with the Stripe owned bank account receiving the transfer.


  **:funding_method** :: *:string*

  The credit transfer rails the sender used to push this transfer. The possible rails are: Faster Payments, BACS, CHAPS, and wire transfers. Currently only Faster Payments is supported.


  **:last4** :: *:string*

  Last 4 digits of sender account number associated with the transfer.


  **:reference** :: *:string*

  Sender entered arbitrary information about the transfer.


  **:sender_account_number** :: *:string*

  Sender account number associated with the transfer.


  **:sender_name** :: *:string*

  Sender name associated with the transfer.


  **:sender_sort_code** :: *:string*

  Sender sort code associated with the transfer.


  """

  @primary_key false
  typed_embedded_schema do
    field(:fingerprint, :string)

    field(:funding_method, :string)

    field(:last4, :string)

    field(:reference, :string)

    field(:sender_account_number, :string)

    field(:sender_name, :string)

    field(:sender_sort_code, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :sender_sort_code,
      :sender_name,
      :sender_account_number,
      :reference,
      :last4,
      :funding_method,
      :fingerprint
    ])
  end
end