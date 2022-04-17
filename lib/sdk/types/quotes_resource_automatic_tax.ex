defmodule ExOAPI.Stripe.Schemas.QuotesResourceAutomaticTax do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:enabled** :: *:boolean*

  Automatically calculate taxes


  **:status** :: *:string*

  The status of the most recent automated tax calculation for this quote.


  """

  @primary_key false
  typed_embedded_schema do
    field(:enabled, :boolean)

    field(:status, Ecto.Enum, values: [:requires_location_inputs, :failed, :complete])
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:status, :enabled])
    |> validate_required([:enabled])
  end
end