defmodule ExOAPI.Stripe.Schemas.SubscriptionScheduleCurrentPhase do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:end_date** :: *:integer*

  The end of this phase of the subscription schedule.


  **:start_date** :: *:integer*

  The start of this phase of the subscription schedule.


  """

  @primary_key false
  typed_embedded_schema do
    field(:end_date, :integer)

    field(:start_date, :integer)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:start_date, :end_date])
    |> validate_required([:start_date, :end_date])
  end
end