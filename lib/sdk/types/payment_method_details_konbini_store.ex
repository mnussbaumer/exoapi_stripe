defmodule ExOAPI.Stripe.Schemas.PaymentMethodDetailsKonbiniStore do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:chain** :: *:string*

  The name of the convenience store chain where the payment was completed.


  """

  @primary_key false
  typed_embedded_schema do
    field(:chain, Ecto.Enum, values: [:seicomart, :ministop, :lawson, :familymart])
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:chain])
  end
end