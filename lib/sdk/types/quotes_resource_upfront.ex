defmodule ExOAPI.Stripe.Schemas.QuotesResourceUpfront do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:amount_subtotal** :: *:integer*

  Total before any discounts or taxes are applied.


  **:amount_total** :: *:integer*

  Total after discounts and taxes are applied.


  **::data** :: *ExOAPI.Stripe.Schemas.Item*


  **:has_more** :: *:boolean*

  True if this list has another page of items after this one that can be fetched.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value. Always has the value `list`.


  **:url** :: *:string*

  The URL where this list can be accessed.


  **:total_details** :: *ExOAPI.Stripe.Schemas.QuotesResourceTotalDetails*


  """

  @primary_key false
  typed_embedded_schema do
    field(:amount_subtotal, :integer)

    field(:amount_total, :integer)

    field(:line_items, :map)

    embeds_one(:total_details, ExOAPI.Stripe.Schemas.QuotesResourceTotalDetails)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:line_items, :amount_total, :amount_subtotal])
    |> validate_required([:amount_total, :amount_subtotal])
    |> cast_embed(:total_details, required: true)
  end
end