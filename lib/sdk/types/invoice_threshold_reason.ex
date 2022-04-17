defmodule ExOAPI.Stripe.Schemas.InvoiceThresholdReason do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:amount_gte** :: *:integer*

  The total invoice amount threshold boundary if it triggered the threshold invoice.


  **::item_reasons** :: *ExOAPI.Stripe.Schemas.InvoiceItemThresholdReason*


  """

  @primary_key false
  typed_embedded_schema do
    field(:amount_gte, :integer)

    embeds_many(:item_reasons, ExOAPI.Stripe.Schemas.InvoiceItemThresholdReason)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:amount_gte])
    |> cast_embed(:item_reasons, required: true)
  end
end