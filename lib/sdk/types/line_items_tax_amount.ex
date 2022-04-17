defmodule ExOAPI.Stripe.Schemas.LineItemsTaxAmount do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:amount** :: *:integer*

  Amount of tax applied for this rate.


  **:rate** :: *ExOAPI.Stripe.Schemas.TaxRate*


  """

  @primary_key false
  typed_embedded_schema do
    field(:amount, :integer)

    embeds_one(:rate, ExOAPI.Stripe.Schemas.TaxRate)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:amount])
    |> validate_required([:amount])
    |> cast_embed(:rate, required: true)
  end
end