defmodule ExOAPI.Stripe.Schemas.InvoicePaymentMethodOptionsCustomerBalanceBankTransfer do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:type** :: *:string*

  The bank transfer type that can be used for funding. Permitted values include: `us_bank_account`, `eu_bank_account`, `id_bank_account`, `gb_bank_account`, `jp_bank_account`, `mx_bank_account`, `eu_bank_transfer`, `gb_bank_transfer`, `id_bank_transfer`, `jp_bank_transfer`, `mx_bank_transfer`, or `us_bank_transfer`.


  """

  @primary_key false
  typed_embedded_schema do
    field(:type, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:type])
  end
end