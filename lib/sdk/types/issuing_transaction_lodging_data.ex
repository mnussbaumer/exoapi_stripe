defmodule ExOAPI.Stripe.Schemas.IssuingTransactionLodgingData do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:check_in_at** :: *:integer*

  The time of checking into the lodging.


  **:nights** :: *:integer*

  The number of nights stayed at the lodging.


  """

  @primary_key false
  typed_embedded_schema do
    field(:check_in_at, :integer)

    field(:nights, :integer)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:nights, :check_in_at])
  end
end