defmodule ExOAPI.Stripe.Schemas.InvoicePaymentMethodOptionsCustomerBalance do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:bank_transfer** :: *ExOAPI.Stripe.Schemas.InvoicePaymentMethodOptionsCustomerBalanceBankTransfer*


  **:funding_type** :: *:string*

  The funding method type to be used when there are not enough funds in the customer balance. Permitted values include: `bank_transfer`.


  """

  @primary_key false
  typed_embedded_schema do
    embeds_one(
      :bank_transfer,
      ExOAPI.Stripe.Schemas.InvoicePaymentMethodOptionsCustomerBalanceBankTransfer
    )

    field(:funding_type, Ecto.Enum, values: [:bank_transfer])
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:funding_type])
    |> cast_embed(:bank_transfer)
  end
end