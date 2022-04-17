defmodule ExOAPI.Stripe.Schemas.PaymentMethodDetailsBoleto do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:tax_id** :: *ExOAPI.Stripe.Schemas.TaxId*

  The tax ID of the customer (CPF for individuals consumers or CNPJ for businesses consumers)


  """

  @primary_key false
  typed_embedded_schema do
    field(:tax_id, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:tax_id])
    |> validate_required([:tax_id])
  end
end