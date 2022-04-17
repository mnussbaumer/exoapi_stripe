defmodule ExOAPI.Stripe.Schemas.IssuingCardholderCompany do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:tax_id_provided** :: *:boolean*

  Whether the company's business ID number was provided.


  """

  @primary_key false
  typed_embedded_schema do
    field(:tax_id_provided, :boolean)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:tax_id_provided])
    |> validate_required([:tax_id_provided])
  end
end