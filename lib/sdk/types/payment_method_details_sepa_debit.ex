defmodule ExOAPI.Stripe.Schemas.PaymentMethodDetailsSepaDebit do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:bank_code** :: *:string*

  Bank code of bank associated with the bank account.


  **:branch_code** :: *:string*

  Branch code of bank associated with the bank account.


  **:country** :: *:string*

  Two-letter ISO code representing the country the bank account is located in.


  **:fingerprint** :: *:string*

  Uniquely identifies this particular bank account. You can use this attribute to check whether two bank accounts are the same.


  **:last4** :: *:string*

  Last four characters of the IBAN.


  **:mandate** :: *ExOAPI.Stripe.Schemas.Mandate*

  ID of the mandate used to make this payment.


  """

  @primary_key false
  typed_embedded_schema do
    field(:bank_code, :string)

    field(:branch_code, :string)

    field(:country, :string)

    field(:fingerprint, :string)

    field(:last4, :string)

    field(:mandate, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:mandate, :last4, :fingerprint, :country, :branch_code, :bank_code])
  end
end