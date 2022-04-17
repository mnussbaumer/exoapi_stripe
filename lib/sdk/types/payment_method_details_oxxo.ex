defmodule ExOAPI.Stripe.Schemas.PaymentMethodDetailsOxxo do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:number** :: *:string*

  OXXO reference number


  """

  @primary_key false
  typed_embedded_schema do
    field(:number, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:number])
  end
end