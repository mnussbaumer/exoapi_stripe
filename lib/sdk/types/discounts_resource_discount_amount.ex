defmodule ExOAPI.Stripe.Schemas.DiscountsResourceDiscountAmount do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:amount** :: *:integer*

  The amount, in %s, of the discount.


  **:discount** :: *ExOAPI.Stripe.Schemas.DeletedDiscount | ExOAPI.Stripe.Schemas.Discount | :string*

  The discount that was applied to get this discount amount.


  """

  @primary_key false
  typed_embedded_schema do
    field(:amount, :integer)

    field(:discount, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.Discount, ExOAPI.Stripe.Schemas.DeletedDiscount]
    )
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:discount, :amount])
    |> validate_required([:discount, :amount])
  end
end