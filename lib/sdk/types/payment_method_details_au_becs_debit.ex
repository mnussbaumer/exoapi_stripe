defmodule ExOAPI.Stripe.Schemas.PaymentMethodDetailsAuBecsDebit do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:bsb_number** :: *:string*

  Bank-State-Branch number of the bank account.


  **:fingerprint** :: *:string*

  Uniquely identifies this particular bank account. You can use this attribute to check whether two bank accounts are the same.


  **:last4** :: *:string*

  Last four digits of the bank account number.


  **:mandate** :: *ExOAPI.Stripe.Schemas.Mandate*

  ID of the mandate used to make this payment.


  """

  @primary_key false
  typed_embedded_schema do
    field(:bsb_number, :string)

    field(:fingerprint, :string)

    field(:last4, :string)

    field(:mandate, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:mandate, :last4, :fingerprint, :bsb_number])
  end
end