defmodule ExOAPI.Stripe.Schemas.SourceTypeAcssDebit do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:bank_address_city** :: *:string*


  **:bank_address_line_1** :: *:string*


  **:bank_address_line_2** :: *:string*


  **:bank_address_postal_code** :: *:string*


  **:bank_name** :: *:string*


  **:category** :: *:string*


  **:country** :: *:string*


  **:fingerprint** :: *:string*


  **:last4** :: *:string*


  **:routing_number** :: *:string*


  """

  @primary_key false
  typed_embedded_schema do
    field(:bank_address_city, :string)

    field(:bank_address_line_1, :string)

    field(:bank_address_line_2, :string)

    field(:bank_address_postal_code, :string)

    field(:bank_name, :string)

    field(:category, :string)

    field(:country, :string)

    field(:fingerprint, :string)

    field(:last4, :string)

    field(:routing_number, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :routing_number,
      :last4,
      :fingerprint,
      :country,
      :category,
      :bank_name,
      :bank_address_postal_code,
      :bank_address_line_2,
      :bank_address_line_1,
      :bank_address_city
    ])
  end
end