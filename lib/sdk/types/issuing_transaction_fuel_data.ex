defmodule ExOAPI.Stripe.Schemas.IssuingTransactionFuelData do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:type** :: *:string*

  The type of fuel that was purchased. One of `diesel`, `unleaded_plus`, `unleaded_regular`, `unleaded_super`, or `other`.


  **:unit** :: *:string*

  The units for `volume_decimal`. One of `us_gallon` or `liter`.


  **:unit_cost_decimal** :: *:string*

  The cost in cents per each unit of fuel, represented as a decimal string with at most 12 decimal places.


  **:volume_decimal** :: *:string*

  The volume of the fuel that was pumped, represented as a decimal string with at most 12 decimal places.


  """

  @primary_key false
  typed_embedded_schema do
    field(:type, :string)

    field(:unit, :string)

    field(:unit_cost_decimal, :string)

    field(:volume_decimal, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:volume_decimal, :unit_cost_decimal, :unit, :type])
    |> validate_required([:unit_cost_decimal, :unit, :type])
  end
end