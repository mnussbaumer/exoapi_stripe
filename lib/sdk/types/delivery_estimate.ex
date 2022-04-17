defmodule ExOAPI.Stripe.Schemas.DeliveryEstimate do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:date** :: *:string*

  If `type` is `"exact"`, `date` will be the expected delivery date in the format YYYY-MM-DD.


  **:earliest** :: *:string*

  If `type` is `"range"`, `earliest` will be be the earliest delivery date in the format YYYY-MM-DD.


  **:latest** :: *:string*

  If `type` is `"range"`, `latest` will be the latest delivery date in the format YYYY-MM-DD.


  **:type** :: *:string*

  The type of estimate. Must be either `"range"` or `"exact"`.


  """

  @primary_key false
  typed_embedded_schema do
    field(:date, :string)

    field(:earliest, :string)

    field(:latest, :string)

    field(:type, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:type, :latest, :earliest, :date])
    |> validate_required([:type])
  end
end