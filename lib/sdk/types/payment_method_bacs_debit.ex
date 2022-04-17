defmodule ExOAPI.Stripe.Schemas.PaymentMethodBacsDebit do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:fingerprint** :: *:string*

  Uniquely identifies this particular bank account. You can use this attribute to check whether two bank accounts are the same.


  **:last4** :: *:string*

  Last four digits of the bank account number.


  **:sort_code** :: *:string*

  Sort code of the bank account. (e.g., `10-20-30`)


  """

  @primary_key false
  typed_embedded_schema do
    field(:fingerprint, :string)

    field(:last4, :string)

    field(:sort_code, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:sort_code, :last4, :fingerprint])
  end
end