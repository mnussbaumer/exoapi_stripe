defmodule ExOAPI.Stripe.Schemas.SourceTypeAchDebit do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:bank_name** :: *:string*


  **:country** :: *:string*


  **:fingerprint** :: *:string*


  **:last4** :: *:string*


  **:routing_number** :: *:string*


  **:type** :: *:string*


  """

  @primary_key false
  typed_embedded_schema do
    field(:bank_name, :string)

    field(:country, :string)

    field(:fingerprint, :string)

    field(:last4, :string)

    field(:routing_number, :string)

    field(:type, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:type, :routing_number, :last4, :fingerprint, :country, :bank_name])
  end
end