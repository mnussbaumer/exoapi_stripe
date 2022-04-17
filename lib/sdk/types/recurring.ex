defmodule ExOAPI.Stripe.Schemas.Recurring do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:aggregate_usage** :: *:string*

  Specifies a usage aggregation strategy for prices of `usage_type=metered`. Allowed values are `sum` for summing up all usage during a period, `last_during_period` for using the last usage record reported within a period, `last_ever` for using the last usage record ever (across period bounds) or `max` which uses the usage record with the maximum reported usage during a period. Defaults to `sum`.


  **:interval** :: *:string*

  The frequency at which a subscription is billed. One of `day`, `week`, `month` or `year`.


  **:interval_count** :: *:integer*

  The number of intervals (specified in the `interval` attribute) between subscription billings. For example, `interval=month` and `interval_count=3` bills every 3 months.


  **:usage_type** :: *:string*

  Configures how the quantity per period should be determined. Can be either `metered` or `licensed`. `licensed` automatically bills the `quantity` set when adding it to a subscription. `metered` aggregates the total usage based on usage records. Defaults to `licensed`.


  """

  @primary_key false
  typed_embedded_schema do
    field(:aggregate_usage, Ecto.Enum, values: [:sum, :max, :last_ever, :last_during_period])

    field(:interval, Ecto.Enum, values: [:year, :week, :month, :day])

    field(:interval_count, :integer)

    field(:usage_type, Ecto.Enum, values: [:metered, :licensed])
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:usage_type, :interval_count, :interval, :aggregate_usage])
    |> validate_required([:usage_type, :interval_count, :interval])
  end
end