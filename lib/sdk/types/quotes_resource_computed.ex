defmodule ExOAPI.Stripe.Schemas.QuotesResourceComputed do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:recurring** :: *ExOAPI.Stripe.Schemas.QuotesResourceRecurring*

  The definitive totals and line items the customer will be charged on a recurring basis. Takes into account the line items with recurring prices and discounts with `duration=forever` coupons only. Defaults to `null` if no inputted line items with recurring prices.


  **:upfront** :: *ExOAPI.Stripe.Schemas.QuotesResourceUpfront*


  """

  @primary_key false
  typed_embedded_schema do
    field(:recurring, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.QuotesResourceRecurring]
    )

    embeds_one(:upfront, ExOAPI.Stripe.Schemas.QuotesResourceUpfront)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:recurring])
    |> cast_embed(:upfront, required: true)
  end
end