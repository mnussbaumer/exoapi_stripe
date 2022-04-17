defmodule ExOAPI.Stripe.Schemas.TerminalConfigurationConfigurationResourceCurrencySpecificConfig do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **::fixed_amounts** :: *:integer*


  **::percentages** :: *:integer*


  **:smart_tip_threshold** :: *:integer*

  Below this amount, fixed amounts will be displayed; above it, percentages will be displayed


  """

  @primary_key false
  typed_embedded_schema do
    field(:fixed_amounts, {:array, :integer})

    field(:percentages, {:array, :integer})

    field(:smart_tip_threshold, :integer)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:smart_tip_threshold, :percentages, :fixed_amounts])
  end
end