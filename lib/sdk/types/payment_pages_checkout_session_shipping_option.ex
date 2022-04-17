defmodule ExOAPI.Stripe.Schemas.PaymentPagesCheckoutSessionShippingOption do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:shipping_amount** :: *:integer*

  A non-negative integer in cents representing how much to charge.


  **:shipping_rate** :: *ExOAPI.Stripe.Schemas.ShippingRate | :string*

  The shipping rate.


  """

  @primary_key false
  typed_embedded_schema do
    field(:shipping_amount, :integer)

    field(:shipping_rate, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.ShippingRate]
    )
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:shipping_rate, :shipping_amount])
    |> validate_required([:shipping_rate, :shipping_amount])
  end
end