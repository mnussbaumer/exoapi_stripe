defmodule ExOAPI.Stripe.Schemas.Period do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:end** :: *:integer*

  The end date of this usage period. All usage up to and including this point in time is included.


  **:start** :: *:integer*

  The start date of this usage period. All usage after this point in time is included.


  """

  @primary_key false
  typed_embedded_schema do
    field(:end, :integer)

    field(:start, :integer)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:start, :end])
  end
end