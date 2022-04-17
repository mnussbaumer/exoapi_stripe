defmodule ExOAPI.Stripe.Schemas.PaymentMethodDetailsKonbini do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:store** :: *ExOAPI.Stripe.Schemas.PaymentMethodDetailsKonbiniStore*

  If the payment succeeded, this contains the details of the convenience store where the payment was completed.


  """

  @primary_key false
  typed_embedded_schema do
    field(:store, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.PaymentMethodDetailsKonbiniStore]
    )
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:store])
  end
end