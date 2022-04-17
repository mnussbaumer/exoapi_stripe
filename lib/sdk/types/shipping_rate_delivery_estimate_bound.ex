defmodule ExOAPI.Stripe.Schemas.ShippingRateDeliveryEstimateBound do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:unit** :: *:string*

  A unit of time.


  **:value** :: *:integer*

  Must be greater than 0.


  """

  @primary_key false
  typed_embedded_schema do
    field(:unit, Ecto.Enum, values: [:week, :month, :hour, :day, :business_day])

    field(:value, :integer)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:value, :unit])
    |> validate_required([:value, :unit])
  end
end