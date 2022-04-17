defmodule ExOAPI.Stripe.Schemas.PaymentPagesCheckoutSessionTotalDetailsResourceBreakdown do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **::discounts** :: *ExOAPI.Stripe.Schemas.LineItemsDiscountAmount*


  **::taxes** :: *ExOAPI.Stripe.Schemas.LineItemsTaxAmount*


  """

  @primary_key false
  typed_embedded_schema do
    embeds_many(:discounts, ExOAPI.Stripe.Schemas.LineItemsDiscountAmount)

    embeds_many(:taxes, ExOAPI.Stripe.Schemas.LineItemsTaxAmount)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [])
    |> cast_embed(:taxes, required: true)
    |> cast_embed(:discounts, required: true)
  end
end