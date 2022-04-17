defmodule ExOAPI.Stripe.Schemas.LineItemsDiscountAmount do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:amount** :: *:integer*

  The amount discounted.


  **:discount** :: *ExOAPI.Stripe.Schemas.Discount*


  """

  @primary_key false
  typed_embedded_schema do
    field(:amount, :integer)

    embeds_one(:discount, ExOAPI.Stripe.Schemas.Discount)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:amount])
    |> validate_required([:amount])
    |> cast_embed(:discount, required: true)
  end
end