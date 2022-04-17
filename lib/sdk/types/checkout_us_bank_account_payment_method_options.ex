defmodule ExOAPI.Stripe.Schemas.CheckoutUsBankAccountPaymentMethodOptions do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:verification_method** :: *:string*

  Bank account verification method.


  """

  @primary_key false
  typed_embedded_schema do
    field(:verification_method, Ecto.Enum, values: [:instant, :automatic])
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:verification_method])
  end
end