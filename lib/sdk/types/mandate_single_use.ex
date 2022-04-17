defmodule ExOAPI.Stripe.Schemas.MandateSingleUse do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:amount** :: *:integer*

  On a single use mandate, the amount of the payment.


  **:currency** :: *:string*

  On a single use mandate, the currency of the payment.


  """

  @primary_key false
  typed_embedded_schema do
    field(:amount, :integer)

    field(:currency, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:currency, :amount])
    |> validate_required([:currency, :amount])
  end
end