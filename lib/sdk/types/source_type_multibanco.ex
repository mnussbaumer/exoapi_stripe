defmodule ExOAPI.Stripe.Schemas.SourceTypeMultibanco do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:entity** :: *:string*


  **:reference** :: *:string*


  **:refund_account_holder_address_city** :: *:string*


  **:refund_account_holder_address_country** :: *:string*


  **:refund_account_holder_address_line1** :: *:string*


  **:refund_account_holder_address_line2** :: *:string*


  **:refund_account_holder_address_postal_code** :: *:string*


  **:refund_account_holder_address_state** :: *:string*


  **:refund_account_holder_name** :: *:string*


  **:refund_iban** :: *:string*


  """

  @primary_key false
  typed_embedded_schema do
    field(:entity, :string)

    field(:reference, :string)

    field(:refund_account_holder_address_city, :string)

    field(:refund_account_holder_address_country, :string)

    field(:refund_account_holder_address_line1, :string)

    field(:refund_account_holder_address_line2, :string)

    field(:refund_account_holder_address_postal_code, :string)

    field(:refund_account_holder_address_state, :string)

    field(:refund_account_holder_name, :string)

    field(:refund_iban, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :refund_iban,
      :refund_account_holder_name,
      :refund_account_holder_address_state,
      :refund_account_holder_address_postal_code,
      :refund_account_holder_address_line2,
      :refund_account_holder_address_line1,
      :refund_account_holder_address_country,
      :refund_account_holder_address_city,
      :reference,
      :entity
    ])
  end
end