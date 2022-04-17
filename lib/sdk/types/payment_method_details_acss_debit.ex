defmodule ExOAPI.Stripe.Schemas.PaymentMethodDetailsAcssDebit do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:bank_name** :: *:string*

  Name of the bank associated with the bank account.


  **:fingerprint** :: *:string*

  Uniquely identifies this particular bank account. You can use this attribute to check whether two bank accounts are the same.


  **:institution_number** :: *:string*

  Institution number of the bank account


  **:last4** :: *:string*

  Last four digits of the bank account number.


  **:mandate** :: *ExOAPI.Stripe.Schemas.Mandate*

  ID of the mandate used to make this payment.


  **:transit_number** :: *:string*

  Transit number of the bank account.


  """

  @primary_key false
  typed_embedded_schema do
    field(:bank_name, :string)

    field(:fingerprint, :string)

    field(:institution_number, :string)

    field(:last4, :string)

    field(:mandate, :string)

    field(:transit_number, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :transit_number,
      :mandate,
      :last4,
      :institution_number,
      :fingerprint,
      :bank_name
    ])
  end
end