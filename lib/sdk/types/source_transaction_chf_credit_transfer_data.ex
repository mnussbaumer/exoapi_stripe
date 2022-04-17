defmodule ExOAPI.Stripe.Schemas.SourceTransactionChfCreditTransferData do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:reference** :: *:string*

  Reference associated with the transfer.


  **:sender_address_country** :: *:string*

  Sender's country address.


  **:sender_address_line1** :: *:string*

  Sender's line 1 address.


  **:sender_iban** :: *:string*

  Sender's bank account IBAN.


  **:sender_name** :: *:string*

  Sender's name.


  """

  @primary_key false
  typed_embedded_schema do
    field(:reference, :string)

    field(:sender_address_country, :string)

    field(:sender_address_line1, :string)

    field(:sender_iban, :string)

    field(:sender_name, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :sender_name,
      :sender_iban,
      :sender_address_line1,
      :sender_address_country,
      :reference
    ])
  end
end