defmodule ExOAPI.Stripe.Schemas.PromotionCodesResourceRestrictions do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:first_time_transaction** :: *:boolean*

  A Boolean indicating if the Promotion Code should only be redeemed for Customers without any successful payments or invoices


  **:minimum_amount** :: *:integer*

  Minimum amount required to redeem this Promotion Code into a Coupon (e.g., a purchase must be $100 or more to work).


  **:minimum_amount_currency** :: *:string*

  Three-letter [ISO code](https://stripe.com/docs/currencies) for minimum_amount


  """

  @primary_key false
  typed_embedded_schema do
    field(:first_time_transaction, :boolean)

    field(:minimum_amount, :integer)

    field(:minimum_amount_currency, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:minimum_amount_currency, :minimum_amount, :first_time_transaction])
    |> validate_required([:first_time_transaction])
  end
end