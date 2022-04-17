defmodule ExOAPI.Stripe.Schemas.PaymentPagesCheckoutSessionConsentCollection do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:promotions** :: *:string*

  If set to `auto`, enables the collection of customer consent for promotional communications. The Checkout
  Session will determine whether to display an option to opt into promotional communication
  from the merchant depending on the customer's locale. Only available to US merchants.


  """

  @primary_key false
  typed_embedded_schema do
    field(:promotions, Ecto.Enum, values: [:auto])
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:promotions])
  end
end