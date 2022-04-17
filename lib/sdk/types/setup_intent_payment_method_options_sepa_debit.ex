defmodule ExOAPI.Stripe.Schemas.SetupIntentPaymentMethodOptionsSepaDebit do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:mandate_options** :: *list(:map)*


  """

  @primary_key false
  typed_embedded_schema do
    field(:mandate_options, {:array, :map})
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:mandate_options])
  end
end