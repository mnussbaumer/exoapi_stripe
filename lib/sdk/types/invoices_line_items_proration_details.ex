defmodule ExOAPI.Stripe.Schemas.InvoicesLineItemsProrationDetails do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:credited_items** :: *ExOAPI.Stripe.Schemas.InvoicesLineItemsCreditedItems*

  For a credit proration `line_item`, the original debit line_items to which the credit proration applies.


  """

  @primary_key false
  typed_embedded_schema do
    field(:credited_items, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.InvoicesLineItemsCreditedItems]
    )
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:credited_items])
  end
end