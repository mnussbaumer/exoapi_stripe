defmodule ExOAPI.Stripe.Schemas.InvoiceItemThresholdReason do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **::line_item_ids** :: *:string*


  **:usage_gte** :: *:integer*

  The quantity threshold boundary that applied to the given line item.


  """

  @primary_key false
  typed_embedded_schema do
    field(:line_item_ids, {:array, :string})

    field(:usage_gte, :integer)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:usage_gte, :line_item_ids])
    |> validate_required([:usage_gte])
  end
end