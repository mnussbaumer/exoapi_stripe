defmodule ExOAPI.Stripe.Schemas.PlanTier do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:flat_amount** :: *:integer*

  Price for the entire tier.


  **:flat_amount_decimal** :: *:string*

  Same as `flat_amount`, but contains a decimal value with at most 12 decimal places.


  **:unit_amount** :: *:integer*

  Per unit price for units relevant to the tier.


  **:unit_amount_decimal** :: *:string*

  Same as `unit_amount`, but contains a decimal value with at most 12 decimal places.


  **:up_to** :: *:integer*

  Up to and including to this quantity will be contained in the tier.


  """

  @primary_key false
  typed_embedded_schema do
    field(:flat_amount, :integer)

    field(:flat_amount_decimal, :string)

    field(:unit_amount, :integer)

    field(:unit_amount_decimal, :string)

    field(:up_to, :integer)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :up_to,
      :unit_amount_decimal,
      :unit_amount,
      :flat_amount_decimal,
      :flat_amount
    ])
  end
end