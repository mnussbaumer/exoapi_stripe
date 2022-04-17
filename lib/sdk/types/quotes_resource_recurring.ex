defmodule ExOAPI.Stripe.Schemas.QuotesResourceRecurring do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:amount_subtotal** :: *:integer*

  Total before any discounts or taxes are applied.


  **:amount_total** :: *:integer*

  Total after discounts and taxes are applied.


  **:interval** :: *:string*

  The frequency at which a subscription is billed. One of `day`, `week`, `month` or `year`.


  **:interval_count** :: *:integer*

  The number of intervals (specified in the `interval` attribute) between subscription billings. For example, `interval=month` and `interval_count=3` bills every 3 months.


  **:total_details** :: *ExOAPI.Stripe.Schemas.QuotesResourceTotalDetails*


  """

  @primary_key false
  typed_embedded_schema do
    field(:amount_subtotal, :integer)

    field(:amount_total, :integer)

    field(:interval, Ecto.Enum, values: [:year, :week, :month, :day])

    field(:interval_count, :integer)

    embeds_one(:total_details, ExOAPI.Stripe.Schemas.QuotesResourceTotalDetails)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:interval_count, :interval, :amount_total, :amount_subtotal])
    |> validate_required([:interval_count, :interval, :amount_total, :amount_subtotal])
    |> cast_embed(:total_details, required: true)
  end
end