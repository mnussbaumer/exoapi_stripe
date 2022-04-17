defmodule ExOAPI.Stripe.Schemas.IssuingAuthorizationAmountDetails do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:atm_fee** :: *:integer*

  The fee charged by the ATM for the cash withdrawal.


  """

  @primary_key false
  typed_embedded_schema do
    field(:atm_fee, :integer)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:atm_fee])
  end
end