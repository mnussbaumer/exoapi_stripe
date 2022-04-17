defmodule ExOAPI.Stripe.Schemas.PaymentPagesCheckoutSessionShippingAddressCollection do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **::allowed_countries** :: *:string*


  """

  @primary_key false
  typed_embedded_schema do
    field(:allowed_countries, {:array, :string})
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:allowed_countries])
  end
end