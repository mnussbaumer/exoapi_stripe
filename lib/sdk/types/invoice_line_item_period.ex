defmodule ExOAPI.Stripe.Schemas.InvoiceLineItemPeriod do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:end** :: *:integer*

  The end of the period, which must be greater than or equal to the start.


  **:start** :: *:integer*

  The start of the period.


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
    |> validate_required([:start, :end])
  end
end