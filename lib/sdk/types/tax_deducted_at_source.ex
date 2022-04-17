defmodule ExOAPI.Stripe.Schemas.TaxDeductedAtSource do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:id** :: *:string*

  Unique identifier for the object.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  **:period_end** :: *:integer*

  The end of the invoicing period. This TDS applies to Stripe fees collected during this invoicing period.


  **:period_start** :: *:integer*

  The start of the invoicing period. This TDS applies to Stripe fees collected during this invoicing period.


  **:tax_deduction_account_number** :: *:string*

  The TAN that was supplied to Stripe when TDS was assessed


  """

  @primary_key false
  typed_embedded_schema do
    field(:id, :string)

    field(:object, Ecto.Enum, values: [:tax_deducted_at_source])

    field(:period_end, :integer)

    field(:period_start, :integer)

    field(:tax_deduction_account_number, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:tax_deduction_account_number, :period_start, :period_end, :object, :id])
    |> validate_required([:tax_deduction_account_number, :period_start, :period_end, :object, :id])
  end
end