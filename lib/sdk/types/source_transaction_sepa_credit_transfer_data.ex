defmodule ExOAPI.Stripe.Schemas.SourceTransactionSepaCreditTransferData do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:reference** :: *:string*

  Reference associated with the transfer.


  **:sender_iban** :: *:string*

  Sender's bank account IBAN.


  **:sender_name** :: *:string*

  Sender's name.


  """

  @primary_key false
  typed_embedded_schema do
    field(:reference, :string)

    field(:sender_iban, :string)

    field(:sender_name, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:sender_name, :sender_iban, :reference])
  end
end