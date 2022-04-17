defmodule ExOAPI.Stripe.Schemas.QuotesResourceTotalDetails do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:amount_discount** :: *:integer*

  This is the sum of all the discounts.


  **:amount_shipping** :: *:integer*

  This is the sum of all the shipping amounts.


  **:amount_tax** :: *:integer*

  This is the sum of all the tax amounts.


  **:breakdown** :: *ExOAPI.Stripe.Schemas.QuotesResourceTotalDetailsResourceBreakdown*


  """

  @primary_key false
  typed_embedded_schema do
    field(:amount_discount, :integer)

    field(:amount_shipping, :integer)

    field(:amount_tax, :integer)

    embeds_one(:breakdown, ExOAPI.Stripe.Schemas.QuotesResourceTotalDetailsResourceBreakdown)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:amount_tax, :amount_shipping, :amount_discount])
    |> validate_required([:amount_tax, :amount_discount])
    |> cast_embed(:breakdown)
  end
end