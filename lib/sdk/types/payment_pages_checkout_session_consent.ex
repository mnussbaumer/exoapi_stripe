defmodule ExOAPI.Stripe.Schemas.PaymentPagesCheckoutSessionConsent do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:promotions** :: *:string*

  If `opt_in`, the customer consents to receiving promotional communications
  from the merchant about this Checkout Session.


  """

  @primary_key false
  typed_embedded_schema do
    field(:promotions, Ecto.Enum, values: [:opt_out, :opt_in])
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:promotions])
  end
end