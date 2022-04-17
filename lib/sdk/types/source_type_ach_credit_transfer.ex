defmodule ExOAPI.Stripe.Schemas.SourceTypeAchCreditTransfer do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:account_number** :: *:string*


  **:bank_name** :: *:string*


  **:fingerprint** :: *:string*


  **:refund_account_holder_name** :: *:string*


  **:refund_account_holder_type** :: *:string*


  **:refund_routing_number** :: *:string*


  **:routing_number** :: *:string*


  **:swift_code** :: *:string*


  """

  @primary_key false
  typed_embedded_schema do
    field(:account_number, :string)

    field(:bank_name, :string)

    field(:fingerprint, :string)

    field(:refund_account_holder_name, :string)

    field(:refund_account_holder_type, :string)

    field(:refund_routing_number, :string)

    field(:routing_number, :string)

    field(:swift_code, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :swift_code,
      :routing_number,
      :refund_routing_number,
      :refund_account_holder_type,
      :refund_account_holder_name,
      :fingerprint,
      :bank_name,
      :account_number
    ])
  end
end