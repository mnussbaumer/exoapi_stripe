defmodule ExOAPI.Stripe.Schemas.InvoicesLineItemsCreditedItems do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:invoice** :: *ExOAPI.Stripe.Schemas.Invoice*

  Invoice containing the credited invoice line items


  **::invoice_line_items** :: *:string*


  """

  @primary_key false
  typed_embedded_schema do
    field(:invoice, :string)

    field(:invoice_line_items, {:array, :string})
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:invoice_line_items, :invoice])
    |> validate_required([:invoice])
  end
end