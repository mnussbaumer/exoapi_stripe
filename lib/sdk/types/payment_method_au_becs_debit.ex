defmodule ExOAPI.Stripe.Schemas.PaymentMethodAuBecsDebit do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:bsb_number** :: *:string*

  Six-digit number identifying bank and branch associated with this bank account.


  **:fingerprint** :: *:string*

  Uniquely identifies this particular bank account. You can use this attribute to check whether two bank accounts are the same.


  **:last4** :: *:string*

  Last four digits of the bank account number.


  """

  @primary_key false
  typed_embedded_schema do
    field(:bsb_number, :string)

    field(:fingerprint, :string)

    field(:last4, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:last4, :fingerprint, :bsb_number])
  end
end