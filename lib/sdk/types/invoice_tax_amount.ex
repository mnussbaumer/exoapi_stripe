defmodule ExOAPI.Stripe.Schemas.InvoiceTaxAmount do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:amount** :: *:integer*

  The amount, in %s, of the tax.


  **:inclusive** :: *:boolean*

  Whether this tax amount is inclusive or exclusive.


  **:tax_rate** :: *ExOAPI.Stripe.Schemas.TaxRate | :string*

  The tax rate that was applied to get this tax amount.


  """

  @primary_key false
  typed_embedded_schema do
    field(:amount, :integer)

    field(:inclusive, :boolean)

    field(:tax_rate, ExOAPI.EctoTypes.AnyOf, types: [:string, ExOAPI.Stripe.Schemas.TaxRate])
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:tax_rate, :inclusive, :amount])
    |> validate_required([:tax_rate, :inclusive, :amount])
  end
end